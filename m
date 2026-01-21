Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6858EC44500
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 21:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDBT9anIBaFHb2ecG/0hN+2pzkqiUJQOE2I+DoFDFtQ=; b=4qZV8OTIDrobIb
	zylGMExigJVIB+3eMKsjyDzXbIUbb4lQ2VKfadYBhZRsjE4wuHkItDl6uTXMXblCRbH7iDteZJN5J
	kPy16O/LoJWGF4jUT23/+XU391KfviaVpGRf2jT3AllIZQigkBkBtlGNCbF2Q3d3ndTCtpj5+ldu6
	XYKXM6fOBvKMqmy5pKsbnWLctBpQ6VPH2nazlvvz/bLV4lqhrkomWR6PBSdXMk+0+Gjli5zaHxgOr
	YDNqYi0QkNrrmmZ6grCy1QJb3ueA9MXJLueaUF+lhTWZgZvcLnOIKguDQYXzzBafLk9VtDmK5aH1J
	f83IELWil0O6QDHh4KNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vig3Y-000000065Qe-2uyN;
	Wed, 21 Jan 2026 21:48:04 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vig3I-000000065Pt-4BdK
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 21:47:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b8712507269so28220466b.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 13:47:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769032067; cv=none;
        d=google.com; s=arc-20240605;
        b=jHm4TxFYeQ/Gt+uNQUXVCPZ1oMqNsnDFTcOMEdTK4OMbAfM+McyH0ES3HRMpMSq87b
         +km8wGtesy684ZJW7q7XghncQ11l9lklvZknMQck33+U16ypp7EFWFNmscO8zG0F2sTF
         CHYFKiQfiQmAzeCMzpJfGdnQgX1VNlNRr5hDNWg+2YmjNZNnIzpJ9Z8UqJ1/JBz9zjbe
         0uqeBsw8wKupyeZqbNLAPoS5xHBhlkMO/SF7I4c8MSYGGs9ViqjSc3z23K+zWLENDrQA
         8MO7wbd/3JW5HVBQvUORapBOqZJgNDecNfGHprd1b2wY//pnjQaWbd9v3qzF5SXegCi7
         8QqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFgFOXxHcqqk/Chd6m6zZHG2pY2sV3c/ZZN0cSg34hA=;
        fh=NztQwOsrgLpheifJXu9g3gX3cWtNo2EUaunTIGtSOxU=;
        b=lDBEOqL08+9ZrOzf78Z5HUGbalB5i/MnDl81FHv6eN0/2bOHoNunJbFdbnMAwUvMb+
         2ovOkuWjhlVxww00WRWo6yHtqG7DFvtrSV7Y7Bo6w0sSdQZc4jNVqR6+/WcLAZVll+HA
         /bdySb6nLGyCfo3AH2iQIWu3N4FcRo9ljqOerrxzbLXzwb3Uol2EOaD6gdkrWXSyNIGM
         a0L5Rktu1AcdQD+yaYTP6sBaGv8AlpBeckiCMvIRFkjnTlPzVzzEj4lDC8YaCg2gIOXn
         emLCgTReJ25NPioGzIb7xAQ508oBVAn7oCRs2fbK055XXthY9fCZVrNx3VLpC66KTxI1
         5uOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769032067; x=1769636867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFgFOXxHcqqk/Chd6m6zZHG2pY2sV3c/ZZN0cSg34hA=;
        b=DNvVr7QnKiC9jrimd8t5VJBh5D9Dp3NmdTKXqHAky+L0xNOURy11SHMURtvWoZ+PTO
         90CDcXoW/GxmqFnBMZUQDI0qgchZBVdHsXxbq2snYoCtaX1WR+MNVnzs8QnJXY/twBEi
         ZoizF6FNHwnF4A35dDyrzaYBM9PwhtsJEx3RcO+QM7d654G95Nr41stDoTNyNQg1LuwI
         X7pqZwhSnVNUCQvf+u9rVsEIqzJV8Bw68aWCKqI36fNmrfEq7ug+YASeNj9Y/LU0y7hS
         QBT+fPvKp7NnsFzGfRGabWGlvQPZW3mfoiKgpBqDWtbal4YBmmGaI9529RdJmGbpVqjL
         ZfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769032067; x=1769636867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TFgFOXxHcqqk/Chd6m6zZHG2pY2sV3c/ZZN0cSg34hA=;
        b=WG2HQa3i6TGnZsiLXZaRsEClYeNDavN/cSetbe0H6TJ5RKTSDbRbIpjZvb9Kfs8WFt
         p3u7cgRTa7KTYjHSOKo3rQGyCBV/95tZ1zgPEXUovMU1ujRr0d4OEShYQcolTzzrGYGx
         gCrSMWfPUNM4W4VwtNcWjDyRXta99IhwAQCET1ByjkP1ySzVv8ON/CaJQfDbrCnVuKUc
         pWrv6dzgY4Jhj0jDJ1qcPKDLrv3VnfF5N9Uc7KSNoPpjNQX3wDolF2tIf6b06li4Ed4q
         NBUyXK/+WEySc4ewr+GGpmwfr94o5xQUX2hjiY81msk7FxZJc6xWKJRc9kZcee28Ldn9
         QUxA==
X-Gm-Message-State: AOJu0YyUQXtiARODQS9lv4F5rMUVtjGOE+7Ea8xnM+KCDA76DNyqxEUr
	Axcf+Dmvtg26BUV13LS4m0dUjyL/2XmfQJD8wT4DpHvkSMH9rhpHehCawm53Tl1xt8IkAGdEBdU
	kpIES4hzqVxt5oEPXNAqmbVYOe63+ZlI=
X-Gm-Gg: AZuq6aJxxu+3E/2GT6MRDPaZhg1aWIpJ/cfeP5yyNQxkMj9sqbAG0XflVgFsVZNjPYp
	IyIL+Q4uIeW9o08909txHnSdi787cZiCd+PFuCgftfSL4rtZYeXlKDelNUmEw+GOlMI6AJW94wL
	wfeAhem/pzeeXA1bEOCGytbK9ICIzx+N+ySbOj5kQvUQpXuPKqoHc+ydWMccuOx9mDnw3IcvYPs
	XAqShBbGEbNMvS3hmRdnJhB7wD5fOtHRlhAfUffuznanj3g65q/qRaRS/jsM67OjctKXnRVuzvz
	VyQ=
X-Received: by 2002:a17:906:6a02:b0:b87:b22:f5eb with SMTP id
 a640c23a62f3a-b8800342ae8mr545654366b.31.1769032066854; Wed, 21 Jan 2026
 13:47:46 -0800 (PST)
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:47:35 -0600
X-Gm-Features: AZwV_QjJhTPkHayAMroLRdbBvhR_NU59Z2RYcU1vUqt_PNTli71R5oGHYfWVW-U
Message-ID: <CAFTtA3PDoysu+RyvH+a_ZZ4xCbGrgeYY8Xu=zFqQ__grhWGCtQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] riscv: vector: misc ptrace fixes for debug use-cases
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_134749_088189_89B420DC 
X-CRM114-Status: GOOD (  23.14  )
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

SGkgU2VyZ2V5LAoKT24gU3VuLCBEZWMgMTQsIDIwMjUgYXQgMTA6MzXigK9BTSBTZXJnZXkgTWF0
eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIHNlcmll
cyBzdWdnZXN0cyBmaXhlcyBmb3Igc2V2ZXJhbCBjb3JuZXIgY2FzZXMgaW4gdGhlIFJJU0MtVgo+
IHZlY3RvciBwdHJhY2UgaW1wbGVtZW50YXRpb246Cj4KPiAtIGluaXQgdmVjdG9yIGNvbnRleHQg
d2l0aCBwcm9wZXIgdmxlbmIsIHRvIGF2b2lkIHJlYWRpbmcgemVybyB2bGVuYgo+ICAgYnkgYW4g
ZWFybHkgYXR0YWNoZWQgZGVidWdnZXIKPgo+IC0gZm9sbG93IGdkYnNlcnZlciBleHBlY3RhdGlv
bnMgYW5kIHJldHVybiBFTk9EQVRBIGluc3RlYWQgb2YgRUlOVkFMCj4gICBpZiB2ZWN0b3IgZXh0
ZW5zaW9uIGlzIHN1cHBvcnRlZCBidXQgbm90IHlldCBhY3RpdmF0ZWQgZm9yIHRoZQo+ICAgdHJh
Y2VkIHByb2Nlc3MKPgo+IC0gdmFsaWRhdGUgaW5wdXQgdmVjdG9yIGNzciByZWdpc3RlcnMgaW4g
cHRyYWNlLCB0byBtYWludGFpbiBhbiBhY2N1cmF0ZQo+ICAgdmlldyBvZiB0aGUgdHJhY2VlJ3Mg
dmVjdG9yIGNvbnRleHQgYWNyb3NzIG11bHRpcGxlIGhhbHQvcmVzdW1lCj4gICBkZWJ1ZyBjeWNs
ZXMKPgo+IEZvciBkZXRhaWxlZCBkZXNjcmlwdGlvbiBzZWUgdGhlIGFwcHJvcHJpYXRlIGNvbW1p
dCBtZXNzYWdlcy4gQSBuZXcgdGVzdAo+IHN1aXRlIHZhbGlkYXRlX3ZfcHRyYWNlIGlzIGFkZGVk
IHRvIHRoZSB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IKPiB0byB2ZXJpZnkg
c29tZSBvZiB0aGUgdmVjdG9yIHB0cmFjZSBmdW5jdGlvbmFsaXR5IGFuZCBjb3JuZXIgY2FzZXMu
Cj4KPiBTbyBmYXIgdGVzdGVkIG9uIHRoZSBmb2xsb3dpbmcgcGxhdGZvcm1zOgo+IC0gdGVzdCBp
biBRRU1VIHJ2MzIvcnY2NAo+IC0gdGVzdCBvbiBjOTA4IChCYW5hbmFQaSBDYW5NViBLMjMwRCBa
ZXJvKQo+IC0gdGVzdCBvbiBjOTA2IChNYW5nb1BpIE1RIFBybykKPgo+IFByZXZpb3VzIHZlcnNp
b25zOgo+IC0gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUxMTA4
MTk0MjA3LjEyNTc4NjYtMS1nZW9tYXRzaUBnbWFpbC5jb20vVC8jdQo+IC0gdjM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUxMDI1MjEwNjU1LjQzMDk5LTEtZ2VvbWF0
c2lAZ21haWwuY29tL1QvI3UKPiAtIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDI1MDgyMTE3Mzk1Ny41NjM0NzItMS1nZW9tYXRzaUBnbWFpbC5jb20vVC8jdQo+IC0g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUxMDA3MTE1ODQwLjIz
MjA1NTctMS1nZW9tYXRzaUBnbWFpbC5jb20vVC8jdQo+Cj4gQ2hhbmdlcyBpbiB2NToKPiAtIGFk
ZCBzdXBwb3J0IGFuZCBtaW5pbWFsIHNldCBvZiB0ZXN0cyBmb3IgWFRoZWFkVmVjdG9yCj4KPiBD
aGFuZ2VzIGluIHY0Ogo+IFRoZSBmb3JtICd2c2V0dmxpIHgwLCB4MCwgLi4uJyBjYW4gb25seSBi
ZSB1c2VkIGlmIFZMTUFYIHJlbWFpbnMKPiB1bmNoYW5nZWQsIHNlZSBzcGVjIDYuMi4gVGhpcyBj
b25kaXRpb24gd2FzIG5vdCBtZXQgYnkgdGhlIGluaXRpYWwKPiB2YWx1ZXMgaW4gdGhlIHNlbGZ0
ZXN0cyB3LnIudC4gdGhlIGluaXRpYWwgemVyb2VkIGNvbnRleHQuIFFFTVUgYWNjZXB0ZWQKPiBz
dWNoIHZhbHVlcywgYnV0IGFjdHVhbCBoYXJkd2FyZSAoYzkwOCwgQmFuYW5hUGkgQ2FuTVYgWmVy
byBib2FyZCkgZGlkCj4gbm90LCBzZXR0aW5nIHZpbGwuIFNvIGZpeCB0aGUgc2VsZnRlc3RzIGFm
dGVyIHRlc3Rpbmcgb24gaGFyZHdhcmU6Cj4gLSByZXBsYWNlICd2c2V0dmxpIHgwLCB4MCwgLi4u
JyBieSAndnNldHZsaSByZCwgeDAsIC4uLicKPiAtIGZpeGVkIGluc3RydWN0aW9uIHJldHVybnMg
VkxNQVgsIHNvIHVzZSBpdCBpbiBjaGVja3MgYXMgd2VsbAo+IC0gcmVwbGFjZSBmaXhlZCB2bGVu
YiA9PSAxNiBpbiB0aGUgc3lzY2FsbCB0ZXN0Cj4KPiBDaGFuZ2VzIGluIHYzOgo+IEFkZHJlc3Mg
dGhlIHJldmlldyBjb21tZW50cyBieSBBbmR5IENoaXUgYW5kIHJld29yayB0aGUgYXBwcm9hY2g6
Cj4gLSBkcm9wIGZvcmNlZCB2ZWN0b3IgY29udGV4dCBzYXZlIGVudGlyZWx5Cj4gLSBwZXJmb3Jt
IHN0cmljdCB2YWxpZGF0aW9uIG9mIHZlY3RvciBjc3IgcmVncyBpbiBwdHJhY2UKPgo+IENoYW5n
ZXMgaW4gdjI6Cj4gLSBhZGQgdGhyZWFkX2luZm8gZmxhZyB0byBhbGxvdyB0byBmb3JjZSB2ZWN0
b3IgY29udGV4dCBzYXZlCj4gLSBmb3JjZSB2ZWN0b3IgY29udGV4dCBzYXZlIGFmdGVyIHZlY3Rv
ciBwdHJhY2UgdG8gZW5zdXJlIHZhbGlkIHZlY3Rvcgo+ICAgY29udGV4dCBpbiB0aGUgbmV4dCBw
dHJhY2Ugb3BlcmF0aW9ucwo+IC0gZm9yY2UgdmVjdG9yIGNvbnRleHQgc2F2ZSBvbiB0aGUgZmly
c3QgY29udGV4dCBzd2l0Y2ggYWZ0ZXIgdmVjdG9yCj4gICBjb250ZXh0IGluaXQgdG8gZ2V0IHBy
b3BlciB2bGVuYgo+Cj4gLS0tCj4KPiBJbHlhIE1hbWF5ICgxKToKPiAgIHJpc2N2OiBwdHJhY2U6
IHJldHVybiBFTk9EQVRBIGZvciBpbmFjdGl2ZSB2ZWN0b3IgZXh0ZW5zaW9uCj4KPiBTZXJnZXkg
TWF0eXVrZXZpY2ggKDgpOgo+ICAgcmlzY3Y6IHZlY3RvcjogaW5pdCB2ZWN0b3IgY29udGV4dCB3
aXRoIHByb3BlciB2bGVuYgo+ICAgcmlzY3Y6IGNzcjogZGVmaW5lIHZ0eXBlIHJlZ2lzdGVyIGVs
ZW1lbnRzCj4gICByaXNjdjogcHRyYWNlOiB2YWxpZGF0ZSBpbnB1dCB2ZWN0b3IgY3NyIHJlZ2lz
dGVycwo+ICAgc2VsZnRlc3RzOiByaXNjdjogdGVzdCBwdHJhY2UgdmVjdG9yIGludGVyZmFjZQo+
ICAgc2VsZnRlc3RzOiByaXNjdjogdmVyaWZ5IGluaXRpYWwgdmVjdG9yIHN0YXRlIHdpdGggcHRy
YWNlCj4gICBzZWxmdGVzdHM6IHJpc2N2OiB2ZXJpZnkgc3lzY2FsbHMgZGlzY2FyZCB2ZWN0b3Ig
Y29udGV4dAo+ICAgc2VsZnRlc3RzOiByaXNjdjogdmVyaWZ5IHB0cmFjZSByZWplY3RzIGludmFs
aWQgdmVjdG9yIGNzciBpbnB1dHMKPiAgIHNlbGZ0ZXN0czogcmlzY3Y6IHZlcmlmeSBwdHJhY2Ug
YWNjZXB0cyB2YWxpZCB2ZWN0b3IgY3NyIHZhbHVlcwo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY3NyLmggICAgICAgICAgICAgICAgICB8ICAxNyArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3B0
cmFjZS5jICAgICAgICAgICAgICAgICAgICB8ICA5OCArLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC92
ZWN0b3IuYyAgICAgICAgICAgICAgICAgICAgfCAgMTIgKy0KPiAgLi4uL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Jpc2N2L3ZlY3Rvci8uZ2l0aWdub3JlIHwgICAyICsKPiAgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvcmlzY3YvdmVjdG9yL01ha2VmaWxlIHwgIDEwICstCj4gIC4uLi9zZWxmdGVzdHMvcmlz
Y3YvdmVjdG9yL3ZfaGVscGVycy5jICAgICAgICB8ICAyMyArCj4gIC4uLi9zZWxmdGVzdHMvcmlz
Y3YvdmVjdG9yL3ZfaGVscGVycy5oICAgICAgICB8ICAgMiArCj4gIC4uLi9yaXNjdi92ZWN0b3Iv
dmFsaWRhdGVfdl9wdHJhY2UuYyAgICAgICAgICB8IDkxOSArKysrKysrKysrKysrKysrKysKPiAg
OCBmaWxlcyBjaGFuZ2VkLCAxMDc1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdmFs
aWRhdGVfdl9wdHJhY2UuYwo+Cj4KPiBiYXNlLWNvbW1pdDogOGYwYjRjY2U0NDgxZmIyMjY1MzY5
N2NjZWQ4ZDBkMDQwMjdjYjFlOAo+IC0tCj4gMi41Mi4wCj4KCkZvciB0aGUgc2VyaWVzOgoKVGVz
dGVkLWJ5OiBBbmR5IENoaXUgPGFuZHlibmFjQGdtYWlsLmNvbT4KKG9uIHFlbXUgcnY2NGdjdikK
ClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
