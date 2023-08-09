Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24332C0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9lu1EAlhQjr/+xOlj8MQ2i+iOnH5iw8uPqMZ4QKDpU=; b=funXCIrPpwyDg+
	6ydw1+T+Wm3EtYrsG6TEgke0DUz0L5Q/mB494s/rx5hKDjphbY3UKvAkDUooByn1jvNqk53rQRY4Q
	R78jz/xM1NL+PiOLY+Orvj9hFbsYV6hzobVgufnT/sAgdhIjY6BdNVzZiQ0327F0SF8xDYACocjM/
	h2+erfpn4xIzYWlaoypCn8y+JBfkuloQK9+hlf7xNBsZ6pqOooGSEpsdWrRMwhCGiykXqdaO/7V9K
	C8TiVLGFZG5BHyWMCFzNRkXBjsoKl95WBNG1zN8+9TMDZZ6228miS796M0xpnI1BNyqFCGTXbw+tM
	YaP05VZ5ZcU7CqAOXn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTp3O-005kdP-24;
	Wed, 09 Aug 2023 19:41:10 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTp3L-005kcU-2A
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 19:41:09 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe700f9bf7so179344e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691610065; x=1692214865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8LaconH2lgP5LDck0RfV+3f1pmBZQD1E0DPWA3Tdgo=;
        b=hYMeeb3zOCgsIyyDCmxw9XjFFDHVlhHND5MexFzmdIfZqhzfPbNBGtXKe6Ik5r6Nne
         Y/lHE+qVuF5uDlLQjKEMPAsiQ8nOvIKQHIMEhIJhlDazvUyP41iC9E5cs4EfgUv35QtH
         1DwH8s9zsSF8dMsg6x1R9qmYZLXXEES87BAofZyI5qQe+JINBtusLP7EfhSoW2Q6RJ9U
         L5J9f6IybqsarMMPZGqrh4FuzSdcaU/1PcPSJcML0+sGawQvl+d9MR8PQl7bTEJLBr0I
         gIRvyzLe05GJaX3og7+6gL5JP83WemBo7i0IEGLT2WIY3AoEUX1VM9sVcBy8MBOb+CA3
         wzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691610065; x=1692214865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8LaconH2lgP5LDck0RfV+3f1pmBZQD1E0DPWA3Tdgo=;
        b=k7ofQWMvJEbZJFWoX3dc5BrLBN1DPcTL8sxqBypKdFKsfaLnWg8sJW0lQ+/+xBCggf
         QzQBcBUC71nk2l1E9EueqWYonJy7GraqJOo8WS0pympOOwwJM+B11slO9Ez+GuUVXiSd
         wKPgCDwKhpye5GblCNOA1XVpc9ieZxtKUWknjGPrls1cv3X6Aj8IyF/c3hYPDkt1eCEZ
         2d+lukH1tVvmRwtZ0PLdgB8OsfbOha2m2ByTo8vBLfMVEbDj8OhvfoymTBax6QAIpPXo
         zYYExYOt83GbQSQa2mzlGkf8tieWQhXnCmSpNm9+UEA3h1eOMKUvVTBCCQIgBfZVmexv
         wnMQ==
X-Gm-Message-State: AOJu0YxwqEuhXNTLB71BktKdRFGQOideoy68yZi54DXoBl4H56QW5Sl+
	BQsusANXLYnZyE0TSpWa/pgVep4Y3vCOM5j1mDBpnQ==
X-Google-Smtp-Source: AGHT+IGluFwLiLwERPAYthcQfCfJLqosoujBwaqNEFGbUuHEBLSElR8cJzt0BgStkiMEdTZBOxfS5G/Rt8el5z1QNg4=
X-Received: by 2002:a05:6512:32a5:b0:4f8:766f:8dc3 with SMTP id
 q5-20020a05651232a500b004f8766f8dc3mr69548lfe.32.1691610065013; Wed, 09 Aug
 2023 12:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-10-ajones@ventanamicro.com> <CALs-HssK7ys8kjZPuodoz9qEe_hReyihfbBdQsp1exLH3vxkSQ@mail.gmail.com>
 <20230809-7aa41e2dd2fd2909f1266a20@orel>
In-Reply-To: <20230809-7aa41e2dd2fd2909f1266a20@orel>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 9 Aug 2023 12:40:28 -0700
Message-ID: <CALs-HstiaFeUe3ZzSxCqFC4b1+DNHjsEDSGU0Upp84O9A7h4MQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] RISC-V: Enable cbo.zero in usermode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_124107_950825_3A1DF53D 
X-CRM114-Status: GOOD (  26.23  )
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCA5OjU44oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAwOSwgMjAyMyBhdCAwOTowMDoz
NUFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgOSwgMjAyMyBhdCA0
OjU14oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4g
Li4uCj4gPiA+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgcmlzY3ZfdGhpc19jcHVfaGFz
X2V4dGVuc2lvbl9saWtlbHkoY29uc3QgdW5zaWduZWQgbG9uZyBleHQpCj4gPiA+ICt7Cj4gPiA+
ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFKSAmJiByaXNj
dl9oYXNfZXh0ZW5zaW9uX2xpa2VseShleHQpKQo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJu
IHRydWU7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9u
X2F2YWlsYWJsZShoYXJ0X2lzYVtzbXBfcHJvY2Vzc29yX2lkKCldLmlzYSwgZXh0KTsKPiA+ID4g
K30KPiA+ID4gKwo+ID4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJpc2N2X3RoaXNf
Y3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoY29uc3QgdW5zaWduZWQgbG9uZyBleHQpCj4gPiA+
ICt7Cj4gPiA+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZF
KSAmJiByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KGV4dCkpCj4gPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gKwo+ID4gPiArICAgICAgIHJldHVybiBfX3Jpc2N2X2lz
YV9leHRlbnNpb25fYXZhaWxhYmxlKGhhcnRfaXNhW3NtcF9wcm9jZXNzb3JfaWQoKV0uaXNhLCBl
eHQpOwo+ID4gPiArfQo+ID4KPiA+IEFub3RoZXIgd2F5IHRvIGRvIHRoaXMgd291bGQgYmUgdG8g
YWRkIGEgcGFyYW1ldGVyIHRvCj4gPiByaXNjdl9oYXNfZXh0ZW5zaW9uXyooKSAoYXMgdGhlcmUg
YXJlIHZlcnkgZmV3IHVzZXJzKSwgdGhlbiB0aGVzZSBuZXcKPiA+IGZ1bmN0aW9ucyBjYW4gdHVy
biBhcm91bmQgYW5kIGNhbGwgdGhvc2Ugd2l0aCB0aGUgbmV3IHBhcmFtZXRlciBzZXQgdG8KPiA+
IGhhcnRfaXNhW3NtcF9wcm9jZXNzb3JfaWQoKV0uaXNhLiBJdCdzIGEgdG9zc3VwLCBzbyB1cCB0
byB5b3UuIFRoZQo+ID4gb25seSBhZHZhbnRhZ2UgdG8gaXQgSSBjYW4gYXJndWUgaXMgaXQga2Vl
cHMgdGhlIGNvZGUgZmxvd3MgbW9yZQo+ID4gdW5pZmllZC4KPiA+Cj4KPiBJIGxpa2UgdW5pZmlj
YXRpb24sIGJ1dCBJIHRoaW5rIEknZCBwcmVmZXIgd2UgY3JlYXRlIHdyYXBwZXJzIGFuZAo+IHRy
eSB0byBhdm9pZCBjYWxsZXJzIG5lZWRpbmcgdG8gY29uc3RydWN0IGhhcnRfaXNhW10uaXNhIHBh
cmFtZXRlcnMKPiB0aGVtc2VsdmVzLiBJJ20gYWxzbyBub3QgYSBiaWcgZmFuIG9mIHRoZSBOVUxM
IHBhcmFtZXRlciBuZWVkZWQgd2hlbgo+IHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKCkg
aXMgaW52b2tlZCBmb3IgdGhlIHJpc2N2X2lzYSBiaXRtYXAuCj4gU28gd2UgbmVlZDoKPgo+ICAg
MS4gY2hlY2sgaWYgYW4gZXh0ZW5zaW9uIGlzIGluIHJpc2N2X2lzYQo+ICAgMi4gY2hlY2sgaWYg
YW4gZXh0ZW5zaW9uIGlzIGluIGEgYml0bWFwIHByb3ZpZGVkIGJ5IHRoZSBjYWxsZXIKPiAgIDMu
IGNoZWNrIGlmIGFuIGV4dGVuc2lvbiBpcyBpbiB0aGlzIGNwdSdzIGlzYSBiaXRtYXAKPiAgIDQu
IGNoZWNrIGlmIGFuIGV4dGVuc2lvbiBpcyBpbiB0aGUgaXNhIGJpdG1hcCBvZiBhIGNwdSBwcm92
aWRlZCBieSB0aGUKPiAgICAgIGNhbGxlcgo+Cj4gVGhlIG9ubHkgb25lIHdlIGNhbiBvcHRpbWl6
ZSB3aXRoIGFsdGVybmF0aXZlcyBpcyAoMSksIHNvIGl0IGRlZmluaXRlbHkKPiBnZXRzIHdyYXBw
ZXJzIChyaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseS91bmxpa2VseSgpKS4gKDMpIGFuZCAoNCkg
Y2FuCj4gYWxzbyBnZXQgd3JhcHBlcnMgd2hpY2ggZmlyc3QgdHJ5IHRoZSBvcHRpbWl6ZWQgKDEp
LCBsaWtlIEkgaGF2ZSBhYm92ZS4KPiBBY3R1YWxseSAoMykncyB3cmFwcGVyIGNvdWxkIGJlIGJh
c2VkIG9uICg0KSdzLCBvciBvbmx5IHByb3ZpZGUgd3JhcHBlcnMKPiBmb3IgKDQpCj4KPiAgc3Rh
dGljIF9fYWx3YXlzX2lubGluZSBib29sIHJpc2N2X2NwdV9oYXNfZXh0ZW5zaW9uX2xpa2VseShp
bnQgY3B1LCBjb25zdCB1bnNpZ25lZCBsb25nIGV4dCkKPiAgewo+ICAgICAgaWYgKElTX0VOQUJM
RUQoQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFKSAmJiByaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2Vs
eShleHQpKQo+ICAgICAgICAgIHJldHVybiB0cnVlOwo+Cj4gICAgICByZXR1cm4gX19yaXNjdl9p
c2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtjcHVdLmlzYSwgZXh0KTsKPiAgfQo+Cj4g
IHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9jcHVfaGFzX2V4dGVuc2lvbl91bmxp
a2VseShpbnQgY3B1LCBjb25zdCB1bnNpZ25lZCBsb25nIGV4dCkKPiAgewo+ICAgICAgaWYgKElT
X0VOQUJMRUQoQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFKSAmJiByaXNjdl9oYXNfZXh0ZW5zaW9u
X3VubGlrZWx5KGV4dCkpCj4gICAgICAgICAgcmV0dXJuIHRydWU7Cj4KPiAgICAgIHJldHVybiBf
X3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGhhcnRfaXNhW2NwdV0uaXNhLCBleHQpOwo+
ICB9Cj4KPiBhbmQgdGhlbiB1c2Ugc21wX3Byb2Nlc3Nvcl9pZCgpIGRpcmVjdGx5IGluIHRoZSBj
YWxsZXJzIHRoYXQgbmVlZAo+IHRvIGNoZWNrIHRoaXNfY3B1J3MgZXh0ZW5zaW9ucy4KPgo+IEZv
ciBjYXNlICgyKSwgSSdkIGFkdm9jYXRlIHdlIHJlbmFtZSBfX3Jpc2N2X2lzYV9leHRlbnNpb25f
YXZhaWxhYmxlKCkgdG8KPiByaXNjdl9oYXNfZXh0ZW5zaW9uKCkgYW5kIGRyb3AgdGhlIHJpc2N2
X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKCkgbWFjcm8KPiBpbiBvcmRlciB0byBhdm9pZCBoYXZp
bmcgc29tZSBjYWxscyB3aXRoIFJJU0NWX0lTQV9FWFRfKiBzcGVsbGVkIG91dCBhbmQKPiBvdGhl
cnMgdGhhdCByZWx5IG9uIHRoZSBwYXN0aW5nLiBBbmQsIGlkZWFsbHksIHdlJ2QgY29udmVydCBt
b3N0Cj4gcmlzY3ZfaGFzX2V4dGVuc2lvbihOVUxMLCBleHQpIGNhbGxzIHRvIHJpc2N2X2hhc19l
eHRlbnNpb25fW3VuXWxpa2VseSgpLgoKU291bmRzIG9rIHRvIG1lIQotRXZhbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
