Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5EBE77171
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 08:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBlJfhtDHIYBO4cn4RoMktZ0xJwEzF0Tixww0xxF34I=; b=d+Xupl3Kq7SUOy
	wDVEDBjDLJCBKsEl39POxvkNpoHYzH2RwYqtbbWX1T8d0xbSR1oZsGlgWjFxzCXOdV4ZhJHEQ7sSm
	YhdjsB8346blyEWZOWSkB7zENjl8PxMJ+VjQVucJEx3k3vV37gitUTn7QUZy4+TppBSmCjZJVBCLU
	tsnRPr+vtRznI4cF7VxBNxdv+KI5UbWI3GYJSst2OfxoBwj8tP9EtUZCVI3HEW0VK/XivRQolRCI7
	ldfshsQulITR+nJVJAQps7HOjC9vPuesfcPjlInFfmH24qBfujCNnPHnnUNj+QsBgmL7UCGIxF5SK
	ilVEkF8E2i153E6Eudxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6rH-0000000F7ET-45de;
	Thu, 05 Dec 2024 08:05:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6qO-0000000F73D-1HZ1
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 08:04:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385e35912f1so446925f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 00:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733385854; x=1733990654; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TnSIHwdu3quqhv+Cz0nE/XBqXLH5eziio57wDL0PsRk=;
        b=Q+uysoM+dmBoAtmrNkyyI4O9+DKvuZuZHvrlMLwfhTORyOzelidttnJ5YUzdQwS32N
         Su8KLIaE7z55VaiH1MK1a5AkAsKdRxaxNC/E3ZQOpZk2clqK5kPuJBSo768Xs+m8xl8f
         Q39m8YTpBiD9J/e1Qri7P5TNiSbORbKb7fVgEXZLOXJKFtND2dwsjyiQo09K6Vvg9pei
         OmA4oMK9aa8L2fX+0MRgQfTM1u2Tb6axFkJ44q3iTleltY/FhLyvTmIBdY80E+kd8BAs
         o1G4qRsrgSrbBEaOPKIMUe+i3qpdDi/Hy15Qjs07EiUa1L8RiB3xtL4YOvyt4xEYY0d+
         fZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385854; x=1733990654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnSIHwdu3quqhv+Cz0nE/XBqXLH5eziio57wDL0PsRk=;
        b=XuTuT1QL59h+3LyfEjd/81HEIgmsPqYykgkHOB0ZdsPih+52VyAyf9dScAtyhsDPdi
         P3GpH6kbSDyyJtJ39t5nrXY8JG4jWGDI5zF2EYqdZ2s8zXYO2qtsp1IZyin/iG9aUBMM
         6juKnLIQINoucwTGgL/A8t2AMO2SKicDV0ViR3a5Y5qsWDBXEuS1xVpRkwkCHJZgNp3b
         JcImamnCWbXe7DkZyrslW1AP9o4VVrnWJL0B/lrTot1TH7fNfwCALm85ReO0mcT/KrxF
         j64g3rS3jSDOF3u1qdJkm9Z2rX02mP5x/6OyuMgk7SLkV20C8T09NFp4IuOmNQwxkjk1
         Pzuw==
X-Forwarded-Encrypted: i=1; AJvYcCVUxCsCbzA85vmouDPN1SOsxRzMijMuc+A6e4awYBtNVUycRwQ7YTgYxL4Hbv1620KiJDQKr2Gfu4TckQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS8vJJKM67CUB3rt2ecWDmT1/VM9lgQcSyKVboX4v36dREBGJb
	7Kvkzd25N3LwHL4JUNjVk/0mWYhJyCmDTMpYSxb5gIdqlxqLSzl6NV5BdbnzGSg=
X-Gm-Gg: ASbGncsL9HMbdHQBI7A62qICh6Wj4xQmSlErWNvWs9vRLnoA0uWm3sY6ZSMnhXu3nty
	c4kjQ9RoHhaKfVw+WrBgJ19/HOVltnymcOtym9IryvaT2XrfpZdU/9l7jLN2T08cALk/gCu5eag
	TrWdyef6uaqPhTMkm+e/o+I9qHBLVfluaRproJKiMdRUmugHlTgGz1xBVGYFj0PrcDw6PUn6n3r
	sLmZ7tXDZc8xgF/YSLrHl0CD7GSHOIxcaDHOFMRjxkKT8+qua/P+5R1dnIzar98U4DNwqyULGre
	WtU=
X-Google-Smtp-Source: AGHT+IHU2VquhTAR/13KfHBqWHIbC3cUWDM716tluhLEd/E2UqZwbVxHTzKrH1IAK5EQfXHSpOQh/g==
X-Received: by 2002:a5d:64e8:0:b0:385:f5c4:b318 with SMTP id ffacd0b85a97d-385fd3ed9e9mr7535160f8f.31.1733385854019;
        Thu, 05 Dec 2024 00:04:14 -0800 (PST)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861fc514fcsm1249141f8f.48.2024.12.05.00.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 00:04:13 -0800 (PST)
Date: Thu, 5 Dec 2024 09:04:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2] riscv: selftests: Fix warnings pointer masking test
Message-ID: <20241205-45c00adab2636bf26ce05f70@orel>
References: <20241204-fix_warnings_pointer_masking_tests-v2-1-1bf0c5095f58@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241204-fix_warnings_pointer_masking_tests-v2-1-1bf0c5095f58@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_000416_351866_E3C08C3B 
X-CRM114-Status: GOOD (  23.65  )
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

T24gV2VkLCBEZWMgMDQsIDIwMjQgYXQgMDY6NTc6MTBQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IFdoZW4gY29tcGlsaW5nIHRoZSBwb2ludGVyIG1hc2tpbmcgdGVzdHMgd2l0aCAt
V2FsbCB0aGlzIHdhcm5pbmcKPiBpcyBwcmVzZW50Ogo+IAo+IHBvaW50ZXJfbWFza2luZy5jOiBJ
biBmdW5jdGlvbiDigJh0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGzigJk6Cj4gcG9pbnRlcl9t
YXNraW5nLmM6MjAzOjk6IHdhcm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3Jp
dGXigJkKPiBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkg
Wy1XdW51c2VkLXJlc3VsdF0KPiAgIDIwMyB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUsIDEs
IDApOyB8Cj4gICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+IHBvaW50ZXJfbWFza2luZy5j
OjIwODo5OiB3YXJuaW5nOgo+IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkg
ZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUKPiDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkgWy1XdW51
c2VkLXJlc3VsdF0KPiAgIDIwOCB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+
IAo+IEkgY2FtZSBhY3Jvc3MgdGhpcyBvbiByaXNjdjY0LWxpbnV4LWdudS1nY2MgKFVidW50dQo+
IDExLjQuMC0xdWJ1bnR1MX4yMi4wNCkuCj4gCj4gRml4IHRoaXMgYnkgY2hlY2tpbmcgdGhhdCB0
aGUgbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4gZXF1YWwgdGhlIGV4cGVjdGVkCj4gbnVtYmVyIG9m
IGJ5dGVzIHdyaXR0ZW4uCj4gCj4gRml4ZXM6IDc0NzBiNWFmZDE1MCAoInJpc2N2OiBzZWxmdGVz
dHM6IEFkZCBhIHBvaW50ZXIgbWFza2luZyB0ZXN0IikKPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGll
IEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4g
LSBJIGhhZCByZXQgIT0gMiBmb3IgdGVzdGluZywgSSBjaGFuZ2VkIGl0IHRvIGJlIHJldCAhPSAx
Lgo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNC1maXhf
d2FybmluZ3NfcG9pbnRlcl9tYXNraW5nX3Rlc3RzLXYxLTEtZWExZTk2NjVjZTdhQHJpdm9zaW5j
LmNvbQo+IC0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9t
YXNraW5nLmMgfCAxOSArKysrKysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMKPiBpbmRleCBkZWU0MWI3ZWUz
ZTMuLjIyOWQ4NWNjZmY1MCAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9y
aXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMKPiBAQCAtMTg5LDYgKzE4OSw3IEBAIHN0YXRp
YyB2b2lkIHRlc3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bCh2b2lkKQo+ICB7Cj4gIAljaGFyIHZh
bHVlOwo+ICAJaW50IGZkOwo+ICsJaW50IHJldDsKPiAgCj4gIAlrc2Z0X3ByaW50X21zZygiVGVz
dGluZyB0YWdnZWQgYWRkcmVzcyBBQkkgc3lzY3RsXG4iKTsKPiAgCj4gQEAgLTIwMCwxNCArMjAx
LDI0IEBAIHN0YXRpYyB2b2lkIHRlc3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bCh2b2lkKQo+ICAJ
fQo+ICAKPiAgCXZhbHVlID0gJzEnOwo+IC0JcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+ICsJ
cmV0ID0gcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+ICsJaWYgKHJldCAhPSAxKSB7Cj4gKwkJ
a3NmdF90ZXN0X3Jlc3VsdF9mYWlsKCJXcml0ZSB0byAvcHJvYy9zeXMvYWJpL3RhZ2dlZF9hZGRy
X2Rpc2FibGVkIGZhaWxlZC5cbiIpOwo+ICsJCXJldHVybjsKPiArCX0KPiArCj4gIAlrc2Z0X3Rl
c3RfcmVzdWx0KHNldF90YWdnZWRfYWRkcl9jdHJsKG1pbl9wbWxlbiwgdHJ1ZSkgPT0gLUVJTlZB
TCwKPiAgCQkJICJzeXNjdGwgZGlzYWJsZWRcbiIpOwo+ICAKPiAgCXZhbHVlID0gJzAnOwo+IC0J
cHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+IC0Ja3NmdF90ZXN0X3Jlc3VsdChzZXRfdGFnZ2Vk
X2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUpID09IDAsCj4gLQkJCSAic3lzY3RsIGVuYWJsZWRc
biIpOwo+ICsJcmV0ID0gcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+ICsJaWYgKHJldCAhPSAx
KSB7Cj4gKwkJa3NmdF90ZXN0X3Jlc3VsdF9mYWlsKCJXcml0ZSB0byAvcHJvYy9zeXMvYWJpL3Rh
Z2dlZF9hZGRyX2Rpc2FibGVkIGZhaWxlZC5cbiIpOwo+ICsJCXJldHVybjsKPiArCX0KCkNvdWxk
IG1ha2UgYSB3cmFwcGVyIGZ1bmN0aW9uIGZvciBwd3JpdGUoKSB0byBhdm9pZCBkdXBsaWNhdGlu
ZyB0aGUgcmV0CnZhbHVlIGNoZWNrLgoKPiArCj4gKwlrc2Z0X3Rlc3RfcmVzdWx0KHNldF90YWdn
ZWRfYWRkcl9jdHJsKG1pbl9wbWxlbiwgdHJ1ZSkgPT0gLUVJTlZBTCwKPiArCQkJICJzeXNjdGwg
ZGlzYWJsZWRcbiIpOwoKV2h5IGlzIHRoaXMgY2hhbmdlZCBmcm9tIGV4cGVjdGluZyAwIGZvciB0
aGUgcmV0dXJuIGFuZCBiZWluZyB0aGUKInN5c2N0cmwgZW5hYmxlZCIgdGVzdD8gV2Ugc3RpbGwg
d3JpdGUgJzAnIHRvIHRhZ2dlZF9hZGRyX2Rpc2FibGVkIGhlcmUuCgo+ICAKPiAgCXNldF90YWdn
ZWRfYWRkcl9jdHJsKDAsIGZhbHNlKTsKPiAgCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IDQwMzg0
Yzg0MGVhMTk0NGQ3YzVhMzkyZTg5NzVlZDA4OGVjZjBiMzcKPiBjaGFuZ2UtaWQ6IDIwMjQxMjA0
LWZpeF93YXJuaW5nc19wb2ludGVyX21hc2tpbmdfdGVzdHMtMzg2MGU0ZjM1NDI5Cj4gLS0gCj4g
LSBDaGFybGllCj4KCk5vdCBwYXJ0IG9mIHRoaXMgcGF0Y2gsIGJ1dCBub3cgdGhhdCBJIGxvb2tl
ZCBhdAp0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGwoKSBJIHNlZSB0aGF0CmtzZnRfdGVzdF9y
ZXN1bHRfc2tpcCgpIGlzIGR1cGxpY2F0ZWQuCgpUaGFua3MsCmRyZXcKCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
