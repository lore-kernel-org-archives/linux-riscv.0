Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3601C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+FAJha+g7lVbUpJ50BpLqx74xmSh4uy3vOQ9uTFJ88=; b=q1Y4IcfRweuiQ8
	KoJLP56ryAHjx95ISFCXnyRiezRO1Hg7JWWfYvnOAB9xbtdhDGlbf8nWTbCE72q7bRlg0X/2k4Srb
	XZ/ZJGq5HtyIg77Cl45pQZzu+WYtQkBlWtMlVkjwa64XkLz014VLqhk+x04gOguh9N0KpwT6AOdh1
	8QgzLydXYuztgJQYSgwe1WQBIoo0g6h+jg3PlVjpZ9eGIgAJYqAY97jOr1/k70hVQOi1xxLtEY8Cl
	M4t/FqvbSUeUftWVV49u08kBShgNiOOejKORf05uwtPIOvO6RJS0b4/diMt3ts/zm5kQ7ZiQroCyR
	KfaNh+o/ji/IObFn6n4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3CB5-00Gm6V-D0; Mon, 20 Jun 2022 07:50:31 +0000
Received: from mail-qv1-f49.google.com ([209.85.219.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3CB2-00Gm47-EG; Mon, 20 Jun 2022 07:50:30 +0000
Received: by mail-qv1-f49.google.com with SMTP id t16so9863661qvh.1;
        Mon, 20 Jun 2022 00:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EtV5ELewzqfb5WlPCrybWjJM2V9SXL9Txpvpslzl7xY=;
        b=gsLav3y692zqA6uq1R6R3JZnaqkgDbGOCnIu/6gJhRwbVxsZgzp1xcwovIl/YDHrJL
         7bPHIO4es8ZyniVb2ssf7z5HCDhFIa0EwrYWRVYWGh5ZDRodyB9FVDs53IDJCrVRcR7+
         atH02EEwt6Jg4mC+2WMAk7aUQewz87E1gEasACPeFvzq7cCrKMxvsQJ6lwMClvLXfuTM
         +9YagcPo0KYpfgKzaqvcgAGkKeJ0TBDKYcPwUgSnjz463hkWSRf+KfCVZdr/balidDeT
         S64tQDxd+xJQbQ9VIKdY2nclz6Y+kdAgoqfKnJlTEOHIaoHvO8004A0EjFCuyDD9P92o
         pDbg==
X-Gm-Message-State: AJIora/+ShuU14h6uqdmzTJ5nGBGindaBWTW0XFF6H26OiBxzEsAIigX
	8Zin7SdkYCR7Iy4j/EKy3XCCs2lMAVU2dw==
X-Google-Smtp-Source: AGRyM1ti6aQDPAEMwlMsKDOA3XnObAfWFXKS7AmenJYoC18cnIO8v/BoUtcN51EkGSdrPtbMTgIILQ==
X-Received: by 2002:a05:6214:21a4:b0:46b:8231:42a with SMTP id t4-20020a05621421a400b0046b8231042amr17784203qvc.16.1655711426616;
        Mon, 20 Jun 2022 00:50:26 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id v63-20020a372f42000000b006a6a5d1e240sm10728245qkh.34.2022.06.20.00.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 00:50:25 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id l11so17495433ybu.13;
        Mon, 20 Jun 2022 00:50:25 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr24122408ybb.202.1655711425255; Mon, 20
 Jun 2022 00:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220619111115.6354-1-nikita.shubin@maquefel.me> <20220619111115.6354-2-nikita.shubin@maquefel.me>
In-Reply-To: <20220619111115.6354-2-nikita.shubin@maquefel.me>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jun 2022 09:50:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoa9H3Nw7ctAbueeVOdJEo_D25niS7E07HWwV2H4Z9Qg@mail.gmail.com>
Message-ID: <CAMuHMdUoa9H3Nw7ctAbueeVOdJEo_D25niS7E07HWwV2H4Z9Qg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] RISC-V: Create unique identification for SoC PMU
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
	Sunil V L <sunilvl@ventanamicro.com>, 
	=?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>, 
	linux@yadro.com, Nikita Shubin <n.shubin@yadro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_005028_517040_4E7D4ED4 
X-CRM114-Status: GOOD (  21.59  )
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

SGkgTmlraXRhLAoKT24gU3VuLCBKdW4gMTksIDIwMjIgYXQgMToxMSBQTSBOaWtpdGEgU2h1Ymlu
IDxuaWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPiBGcm9tOiBOaWtpdGEgU2h1Ymlu
IDxuLnNodWJpbkB5YWRyby5jb20+Cj4KPiBQcm92aWRlIFJJU0MtViBTQkkgUE1VIGlkIHRvIGRp
c3Rpbmd1aXNoIGRpZmZlcmVudCBjb3JlcyBvciBTb0NzIHZpYQo+ICJkZXZpY2VzL3BsYXRmb3Jt
L3Jpc2N2LXBtdS9pZCIgc3lzZnMgZW50cnkuCj4KPiBUaGUgaWRlbnRpZmljYXRpb24gaXMgZ2Vu
ZXJhdGVkIGFzIHN0cmluZyBvZiBtYXJjaGlkLCBtaW1waWQsIG12ZW5kb3JpZAo+IGluIGhleCBm
b3JtYXQgc2VwYXJhdGVkIGJ5IGNvbWEgLSAiMHg3MDAzMiwweDcwMDMyLDB4MCIuCj4KPiBUaGUg
Q1NScyBhcmUgZGV0YWlsZWQgaW4gdGhlIFJJU0MtViBwcml2aWxlZ2VkIHNwZWMgWzFdLgo+IFsx
XSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1hbnVhbAo+Cj4gSW5zcGlyZWQt
Ynk6IEpvw6NvIE3DoXJpbyBEb21pbmdvcyA8am9hby5tYXJpb0B0ZWNuaWNvLnVsaXNib2EucHQ+
Cj4gU2lnbmVkLW9mZi1ieTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgoKVGhh
bmtzIGZvciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCgo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMKPiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAgLTY5Myw2
ICs2OTMsMjggQEAgc3RhdGljIGludCBwbXVfc2JpX3NldHVwX2lycXMoc3RydWN0IHJpc2N2X3Bt
dSAqcG11LCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGUKPiAgICAgICAgIHJldHVybiAwOwo+
ICB9Cj4KPiArc3RhdGljIHNzaXplX3QgaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwgY2hhciAqYnVmKQo+ICt7Cj4gKyAgICAgICBpbnQgbGVuOwo+ICsgICAgICAgc3RydWN0IHJp
c2N2X3BtdSAqcG11ID0gY29udGFpbmVyX29mKGRldl9nZXRfZHJ2ZGF0YShkZXYpLCBzdHJ1Y3Qg
cmlzY3ZfcG11LCBwbXUpOwo+ICsKPiArICAgICAgIGxlbiA9IHNwcmludGYoYnVmLCAiJXNcbiIs
IHBtdS0+cG11aWQpOwo+ICsgICAgICAgaWYgKGxlbiA8PSAwKQo+ICsgICAgICAgICAgICAgICBk
ZXZfZXJyKGRldiwgImludmFsaWQgc3ByaW50ZiBsZW46ICVkXG4iLCBsZW4pOwoKSG93IGNhbiB0
aGlzIGZhaWw/CgpQbGVhc2UgdXNlIHN5c2ZzX2VtaXQoKSBpbnN0ZWFkIG9mIHNwcmludGYoKSwg
YW5kIGRyb3AgdGhlIGVycm9yCm1lc3NhZ2UuCgo+ICsKPiArICAgICAgIHJldHVybiBsZW47Cj4g
K30KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
