Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB01DC47074
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgVF8lXZvTV4VXykOVf4Pl+ORTwBlMXjMsWe2DJGoXQ=; b=w7j5nU7SirUdyH
	OJtdEqBbbPLbPXwk+H9gC88fr4ius6MiUVTvACqf8nB9G0qsWPbmF3S/LTw4FgSUs68P3Uak+rqoZ
	6ly7KNSzOjbbOGAHmue7/XwOPgb3dgTnfjCFJIlGadbv8wIgUZdaY2nzpAZF9mSiItvg+feGEsNLG
	PlR6AIByMUlgCAZqaQ9qYUz9NP0sbfhllakFXrHEW5FBb1VcuWWYZN51cqUgBNBcwU2VtiEpQWg4S
	88OsLyanjrI3vaeJpTu1DM7tWJ4vRa4R5MU7lzQZH+88eju9JoNRNyJYpOLXFLCwgPOlShRTJp52i
	kXVGU4bT2NkE0xdc3YLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzpN-00Aj9C-0D;
	Wed, 03 Jan 2024 11:54:29 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzpI-00Aj6P-26;
	Wed, 03 Jan 2024 11:54:27 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e811c5c1adso85183977b3.2;
        Wed, 03 Jan 2024 03:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704282863; x=1704887663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZdpDg9MgC1yCbq1bYlsWWXIuzgecTcvyQdn+DaFzA4=;
        b=G9gAbCG6Y8ZRcWzZ9l+tK5CxUe3yMtR5az7haAFkm2P3RSMJi+gxgWl8VseRQU2skW
         Eq9YGVapwv92u/t8SAgOCeZyUxhaOd2BL1TXguJCux4NOClvjWzRWJa7tAlPvLXNEGn9
         w2rqbF+6IaYNHyqrpYszON8v3qdYWSS9SDe06S6MxPSZ7g9Hbldj1sTG94rpJ8BSoMg+
         MZrhT0QFvctYzzLCrO0T6Aek7xIm1W5OZGYcJH8bJjTQVuV1lIGojM7XBhMdy/V1p0xv
         m/EeXT/f53PEV+iVCm1GjaUU47lcBT0+IPRAk+pHYnNeSlzfm4juf+YY9R3OBD3uaIB2
         rmkw==
X-Gm-Message-State: AOJu0YxcmXKPanoR6q2pUj8fdMcoj6tEAqZr67ZymcsoXl4py0hmVV2x
	x2e0ozFKTQik1sdSft/2GkVzcd0IWrKW5Q==
X-Google-Smtp-Source: AGHT+IExR6uqkLUqcqiIHpEzt5BKsmEAlM7MJa7G4IAbeXw8aZ4YCpOf9p35tdAGkBL6wTXf+Pp5tQ==
X-Received: by 2002:a81:b413:0:b0:5e8:6945:ff3d with SMTP id h19-20020a81b413000000b005e86945ff3dmr13602992ywi.60.1704282862687;
        Wed, 03 Jan 2024 03:54:22 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id c5-20020a81c945000000b005ea9425db98sm11067132ywl.8.2024.01.03.03.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 03:54:19 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5edf3780534so51958207b3.0;
        Wed, 03 Jan 2024 03:54:19 -0800 (PST)
X-Received: by 2002:a81:8742:0:b0:5e7:7964:c1ea with SMTP id
 x63-20020a818742000000b005e77964c1eamr12605669ywf.46.1704282859111; Wed, 03
 Jan 2024 03:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20240103015240.1065284-1-pvorel@suse.cz> <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
In-Reply-To: <20240103114957.GD1073466@pevik>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jan 2024 12:54:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
Message-ID: <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>, 
	Andrea Cervesato <andrea.cervesato@suse.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Christophe Lyon <christophe.lyon@linaro.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_035425_893317_907893EF 
X-CRM114-Status: GOOD (  23.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGV0ciwKCk9uIFdlZCwgSmFuIDMsIDIwMjQgYXQgMTI6NTDigK9QTSBQZXRyIFZvcmVsIDxw
dm9yZWxAc3VzZS5jej4gd3JvdGU6Cj4gPiBPbiBXZWQsIEphbiAzLCAyMDI0IGF0IDI6NTLigK9B
TSBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4gd3JvdGU6Cj4gPiA+IFVDTElOVVggaXMgYnJv
a2VuIGluIExUUCBhbmQgbm9ib2R5IHJlYWxseSBjYXJlcy4gQWN0dWFsbHkgSSBkYXJlIHRvCj4g
PiA+IHNheSBVQ0xJTlVYIGlzIGRlYWQuIFRoZXJlZm9yZSBJIHByZXBhcmVkIHBhdGNoc2V0IHRv
IHJlbW92ZSBVQ0xJTlVYCj4gPiA+IGZyb20gTFRQLiBXZSBoYXZlIGJlZW4gYWN0aXZlbHkgcmVt
b3ZpbmcgVUNMSU5VWCBmcm9tIExUUCBkdXJpbmcgcmV3cml0ZQo+ID4gPiB0ZXN0cyB0byBuZXcg
TFRQIEFQSS4gVGhpcyByZW1vdmVzIHRoZSByZXN0IGZyb20gdGhlIG9sZCB0ZXN0cyAod2hpY2gK
PiA+ID4gd2lsbCBiZSBzb29uZXIgb3IgbGF0ZXIgcmV3cml0dGVuIHRvIG5ldyBBUEkpLgo+Cj4g
PiA+IEJlY2F1c2UgdGhlIHBhdGNoc2V0IGlzIHF1aXRlIGJpZywgSSBkaWQgbm90IHdhbnQgdG8g
c2VuZCBpdCB0byBtYWlsaW5nCj4gPiA+IGxpc3RzIChidXQgSSBjYW4gZG8gaXQgaWYgeW91IHdh
bnQpLgo+Cj4gPiA+IENhbiB5b3UgcGxlYXNlIGhhdmUgbG9vayBhdCBteSBmb3JrIG9uIGdpdGxh
YiwgYnJhbmNoOiByZW1vdmUtVUNMSU5VWAo+ID4gPiBodHRwczovL2dpdGxhYi5jb20vcGV2aWsv
bHRwLy0vY29tbWl0cy9yZW1vdmUtVUNMSU5VWD9yZWZfdHlwZT1oZWFkcwo+Cj4gPiA+IEJ1aWxk
IHRlc3Q6Cj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9wZXZpay9sdHAvYWN0aW9ucy9ydW5zLzcz
OTI0NzAyMTUKPgo+ID4gVGhhbmtzIGZvciB5b3VyIHNlcmllcyEKPgo+IFRoYW5rIHlvdSBmb3Ig
eW91ciBmZWVkYmFjay4gIE1heSBJIGFkZCB5b3VyIEFja2VkLWJ5OiB0YWcgdG8gdGhlIHNlcmll
cyB3aGVuIHdlCj4gYWdyZWUgdG8gbWVyZ2U/CgpJIGFtIG5vdCBzdXJlIEkgYWdyZWUgd2l0aCB0
aGlzIHNlcmllcy4KUmVtb3Zpbmcgc3VwcG9ydCBmb3IgVUNMSU5VWCBmcm9tIExUUCBpcyBhbG1v
c3QgYSBndWFyYW50ZWUgZm9yCm5vdCBub3RpY2luZyB3aGVuIG1vcmUgYnJlYWthZ2UgaXMgaW50
cm9kdWNlZC4KCkhvdyBleGFjdGx5IGlzIFVDTElOVVggYnJva2VuIGluIExUUD8KClRoYW5rcyEK
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
