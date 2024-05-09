Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ED9C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dI5XwnMe6eYw+tm5oEwh2i+S+vIryEX3l+tnd2sSss=; b=O986liqAwqNU4H3yNoAM+ZJcpq
	HUR6rSNsOxYc0bBH8AsZfSG6qRNv+ovmXYRPTBnE/pxjvTP3EJETa4v63o7L+lkY+FxmagQNdYY9r
	bzmbTL2021AH0wQpVGCvC4BlOiE0rEd/02K9whXB23BhxpwKHpRQatIbK7QHVJZhVkxEhlpHivA3/
	m7w2a9IaB9wYF3AMBueIPgQHsN1LtMEOGFqiDZY6tO9ZCv0pWmPO5rOdEIsqt1snhGSAun01DrZiQ
	//4OuzucWScI+HGrDMKhBd2x3wgLU2LpvinJVTC542Kr236MDNgrJMKmg/+Pz/pZG2yPywfo58wbY
	YQObyknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s58mt-00000002QDM-1b4x;
	Thu, 09 May 2024 18:46:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s58mq-00000002QBm-0cWF
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 18:46:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so1130573b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 11:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715280392; x=1715885192; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qs+zeJ73xYDCsb+04oKc8vKm2skXM6Yjmk5Cex/hmQ=;
        b=pc4t+7repTuqQ+ccMIqKLEzoY97ZvVFY6r1+ANaFFK0UCl9R9ZCBch9J7sQL9D7utg
         S5vZQYWVVxU8wO5BNaaMG5q/uLolSIuF2sWffLY5D1a6wjbXxRictudumeIN7Kx4eRjs
         CiCPL2vIULylGC6T1puexOF4FYb/tw814gQQxingLkuRQBhy0nhkq8/69wzPgsv4V7gX
         ZykmvabDRoWOJRsH6tiOtdBGAYuEGRZWj0lLBYsS+SxaSaUk4Im9cQVUnxllwu3tXOpC
         uSLojOaG8Vd6g7sKObWYtybpPCZUGPuf8jb0Y0eHbpYBP2A4QnM9L2ysq1XjxedTBI6p
         Qu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715280392; x=1715885192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qs+zeJ73xYDCsb+04oKc8vKm2skXM6Yjmk5Cex/hmQ=;
        b=Uk9GJYb5K9WGu/XBui5ydUp0Qtm+jQGMsjod9SbKntifp4GheU5tTViT26JgtKE8kf
         rD3ofUu41lANBA8Gl6Ormqdst1RSHsorzE6zS7EPQjkWYUUu8HChxVt3Fl/SBfwkOm1P
         7SO9XcFbfljgyBhiaE8Lb7wTUYCUQZK7GtdTh13BGelgaRStI53kh0PnEzF03cJCvjmO
         8ddoP3pdHHgBdKc6dMKx4n8IICGng4QVKm4wKFC90yeiSE/ovvQtCBGQwT+6DAEkli1J
         OrXe6J2xNF2m0xmEI1F/KLNQTvnRp96Qu07C7NK+hIwEOeRj7r+fiTh2hSV8vDZ+zrGH
         7MGA==
X-Forwarded-Encrypted: i=1; AJvYcCVe0Iv7sqeBauBrogElLmvZf+jGpmTN/AMmzi5jxQt8UFeO333oajLmfGB98xcuTst9rw0DXfRKsj4GXnfKfGGz+12XqVHFGrv5X4Omb249
X-Gm-Message-State: AOJu0YyGM1Z+YUK08hJRRFQ/mEnIgalAHjeAS18YQTG+vRzjrdc7d+EM
	NMJYq+85eVRhUd3q0nEMS8agQkVKzafd4nLJMohf1erLbcm/E1f3uaEopOGpZYg=
X-Google-Smtp-Source: AGHT+IHSkbFTtM14eAz4leAGtq7pP+xnyJh4LBmDtig93VWvmXkOMQqIKOUJFRYjpBP4l5vncaDl3Q==
X-Received: by 2002:a05:6a20:7486:b0:1af:889e:8b06 with SMTP id adf61e73a8af0-1afde10ad77mr864261637.35.1715280392190;
        Thu, 09 May 2024 11:46:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2afa7b5sm1607660b3a.163.2024.05.09.11.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 11:46:31 -0700 (PDT)
Date: Thu, 9 May 2024 11:46:26 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com, broonie@kernel.org,
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, atishp@atishpatra.org, alex@ghiti.fr,
	bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
	corbet@lwn.net, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Message-ID: <Zj0aAiZiTrt9ACjj@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-5-debug@rivosinc.com>
 <20240410115806.GA4044117-robh@kernel.org>
 <CAKC1njSsZ6wfvJtXkp4J4J6wXFtU92W9JGca-atKxBy8UvUwRg@mail.gmail.com>
 <20240415194105.GA94432-robh@kernel.org>
 <Zh6c0FH2OvrfDLje@debug.ba.rivosinc.com>
 <20240509-cornflake-foyer-e6589c2bc364@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240509-cornflake-foyer-e6589c2bc364@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_114636_218339_F629899B 
X-CRM114-Status: GOOD (  25.53  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgMDksIDIwMjQgYXQgMDc6MTQ6MjZQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+T24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMDg6NDQ6MTZBTSAtMDcwMCwgRGVlcGFrIEd1
cHRhIHdyb3RlOgo+PiBPbiBNb24sIEFwciAxNSwgMjAyNCBhdCAwMjo0MTowNVBNIC0wNTAwLCBS
b2IgSGVycmluZyB3cm90ZToKPj4gPiBPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAwMjozNzoyMVBN
IC0wNzAwLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4+ID4gPiBPbiBXZWQsIEFwciAxMCwgMjAyNCBh
dCA0OjU44oCvQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gPiA+
Cj4+ID4gPiA+IE9uIFdlZCwgQXByIDAzLCAyMDI0IGF0IDA0OjM0OjUyUE0gLTA3MDAsIERlZXBh
ayBHdXB0YSB3cm90ZToKPj4gPiA+ID4gPiBNYWtlIGFuIGVudHJ5IGZvciBjZmkgZXh0ZW5zaW9u
cyBpbiBleHRlbnNpb25zLnlhbWwuCj4+ID4gPiA+ID4KPj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPj4gPiA+ID4gPiAtLS0KPj4gPiA+
ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sICAgICAg
ICAgIHwgMTAgKysrKysrKysrKwo+PiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKQo+PiA+ID4gPiA+Cj4+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+ID4gPiA+ID4gaW5k
ZXggNjNkODFkYzg5NWU1Li40NWI4N2FkNmNjMWMgMTAwNjQ0Cj4+ID4gPiA+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+PiA+
ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwKPj4gPiA+ID4gPiBAQCAtMzE3LDYgKzMxNywxNiBAQCBwcm9wZXJ0aWVzOgo+
PiA+ID4gPiA+ICAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmljYm96IGV4dGVuc2lvbiBmb3Ig
Y2FjaGUtYmxvY2sgemVyb2luZyBhcyByYXRpZmllZAo+PiA+ID4gPiA+ICAgICAgICAgICAgICBp
biBjb21taXQgM2RkNjA2ZiAoIkNyZWF0ZSBjbW9iYXNlLXYxLjAucGRmIikgb2YgcmlzY3YtQ01P
cy4KPj4gPiA+ID4gPgo+PiA+ID4gPiA+ICsgICAgICAgIC0gY29uc3Q6IHppY2ZpbHAKPj4gPiA+
ID4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+PiA+ID4gPiA+ICsgICAgICAgICAgICBUaGUg
c3RhbmRhcmQgWmljZmlscCBleHRlbnNpb24gZm9yIGVuZm9yY2luZyBmb3J3YXJkIGVkZ2UgY29u
dHJvbC1mbG93Cj4+ID4gPiA+ID4gKyAgICAgICAgICAgIGludGVncml0eSBpbiBjb21taXQgM2Ey
MGRjOSBvZiByaXNjdi1jZmkgYW5kIGlzIGluIHB1YmxpYyByZXZpZXcuCj4+ID4gPiA+Cj4+ID4g
PiA+IERvZXMgaW4gcHVibGljIHJldmlldyBtZWFuIHRoZSBjb21taXQgc2hhIGlzIGdvaW5nIHRv
IGNoYW5nZT8KPj4gPiA+ID4KPj4gPiA+Cj4+ID4gPiBMZXNzIGxpa2VseS4gTmV4dCBzdGVwIGFm
dGVyIHB1YmxpYyByZXZpZXcgaXMgdG8gZ2F0aGVyIGNvbW1lbnRzIGZyb20KPj4gPiA+IHB1Ymxp
YyByZXZpZXcuCj4+ID4gPiBJZiBzb21ldGhpbmcgaXMgcmVhbGx5IHByZXNzaW5nIGFuZCBuZWVk
cyB0byBiZSBhZGRyZXNzZWQsIHRoZW4geWVzCj4+ID4gPiB0aGlzIHdpbGwgY2hhbmdlLgo+PiA+
ID4gRWxzZSB0aGlzIGdldHMgcmF0aWZpZWQgYXMgaXQgaXMuCj4+ID4KPj4gPiBJZiB0aGUgY29t
bWl0IHNoYSBjYW4gY2hhbmdlLCB0aGVuIGl0IGlzIHVzZWxlc3MuIFdoYXQncyB0aGUgZ3VhcmFu
dGVlCj4+ID4gc29tZW9uZSBpcyBnb2luZyB0byByZW1lbWJlciB0byB1cGRhdGUgaXQgaWYgaXQg
Y2hhbmdlcz8KPj4KPj4gU29ycnkgZm9yIGxhdGUgcmVwbHkuCj4+Cj4+IEkgd2FzIGZvbGxvd2lu
ZyBleGlzdGluZyB3b3JkaW5ncyBhbmQgcGF0dGVybnMgZm9yIG1lc3NhZ2luZyBpbiB0aGlzIGZp
bGUuCj4+IFlvdSB3b3VsZCByYXRoZXIgaGF2ZSBtZSByZW1vdmUgc2hhIGFuZCBvbmx5IG1lbnRp
b24gdGhhdCBzcGVjIGlzIGluIHB1YmxpYwo+PiByZXZpZXc/Cj4KPk5vcGUsIGhhdmluZyBhIGNv
bW1pdCBzaGEgaXMgZGVzaXJlZC4gTm9uZSBvZiB0aGlzIGlzIG1lcmdlYWJsZSB1bnRpbCBhdAo+
bGVhc3QgdGhlIHNwZWMgYmVjb21lcyBmcm96ZW4sIHNvIHRoZSBzaGEgY2FuIGJlIHVwZGF0ZWQg
YXQgdGhhdCBwb2ludAo+dG8gdGhlIGZyZWV6ZSBzdGF0ZSAtIG9yIGJldHRlciB5ZXQgdG8gdGhl
IHJhdGlmaWVkIHN0YXRlLiBCZWluZyBpbgo+cHVibGljIHJldmlldyBpcyBub3Qgc3VmZmljaWVu
dC4KClNwZWMgaXMgZnJvemVuLgpBcyBwZXIgUlZJIHNwZWMgbGlmZWN5Y2xlLCBzcGVjIGZyZWV6
ZSBpcyBhIHByaW9yIHN0ZXAgdG8gcHVibGljIHJldmlldy4KUHVibGljIHJldmlldyBjb25jbHVk
ZWQgb24gMjV0aCBBcHJpbApodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtc3MtbHAtY2Zp
L21lc3NhZ2UvOTEKCk5leHQgc3RlcCBpcyByYXRpZmljYXRpb24gd2hlbmV2ZXIgYm9hcmQgbWVl
dHMuCgo+Cj5DaGVlcnMsCj5Db25vcgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
