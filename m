Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E4FC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/h2EQ+iVDITVngtRLU6Csgz4cOmKMpQkkrJxTkMV0DE=; b=rQllG7sPPtrtaP3QPaD4ozlJ2D
	dKrIaz/ucW5MVKInaBC7TSo99vJnhZ7JrAHv8DCIsy7h3gHU4jZ/I/XbNSTdAur/xIdAd+Kdk5Jg1
	xDJLNDyw+KR8EnZD1KD9BFTm+jELt6S+RPeDO/1qRCB9yQVs+vEE+8yz+H52lcjUSNE7tR6E7DXt0
	2eglSMO7cwxJVtQZyJc8BZJmQU9PPmjR2BBtig79wpGqtavwo8WkyjNLonADfWJ/9BzikKYrxMFaK
	XtikLtLo7mSIBoGSii/cyWl/g0S6/C4YVY+MqIURiC8hMLB7ByLkxvndXS6m2FdJgDCj8zTaQwxwP
	Vl5GDV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUroV-00D05Z-KQ; Wed, 22 Feb 2023 16:17:51 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUroS-00D04g-CR
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 16:17:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id d7so4861730pfu.4
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igyEttAQLni77423ZlKgf7aaKkJlG6bz2/8tYmS0qDo=;
        b=kZuIspvZDkjd5u+P+nbjt/VqXXsDK2UxnsnCBEGhv0rKX5j8oNDEJj9mcqzdmRofvi
         Fh95Xc/YnEacIpv6MLyDK1NuQfYsABGHVIFBa2Vz1CsDe0MQTlistVn1FtOdkXQ604Wv
         50BIBManz13Ybo29UkphkyLlU4H3Qj9IinnxT/FeDq61nKK0itUqYcw3z4fwJeFHC09c
         WRIr7mvOOZiMu1QnsRZ5BO2dES2kTKaEx68l70PCc4ErIWWxEBDuAYA7ExXta4bsozoV
         OAqw+z+IdMbp67BooOPEg4VKp2a6Rg2ldh76O9STxYekDrLeT5gywNVsMQsFxNFumaTB
         ELTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igyEttAQLni77423ZlKgf7aaKkJlG6bz2/8tYmS0qDo=;
        b=Zmo/fu73Nvr2r2Qsr7iRqCurPGslG41fWd2vOF0cBFc/OjFnFuOZ3U47xttYXYm8yx
         VV3tocuRgw1WaKxI7wrwiARx8bPehewCKVY/4A5LYK6ktTN5lJf1J4pkk5SNfosTw5rK
         jpJJwheqKRSWYo1JoyF6amdLpFGkpltYiifk6apimxzl6cFYS8rXRlLdf5j8IaD1oXdF
         ZKfp4xEIfqrQJzGwM3uQAOiYCTCnXyS85CwGsQhuMFp9zUmmFN9HWxwJURG8Cla0zOVM
         rOhig0oSFtBM9ldkRhQ4NLa+gvAgok1UhMGVPdW4GK25Jo/BbP+/Us7XJ/Rc6g9eocYC
         5adw==
X-Gm-Message-State: AO0yUKVO7BGDlszjzwaJbJ4gsknuoVbZ5cctWIT+gfJY4BlhHMAWb58b
	uVxHZiWkB+hr9Vp6qfLM9HYYoA==
X-Google-Smtp-Source: AK7set8KemCsLgvNeaH6ecw++h7zainrobj7FulrxnXyYz0PprOZYfoF3j9LB76jOTTpKRI36TC0aQ==
X-Received: by 2002:a62:1ad1:0:b0:5a8:bdae:caa7 with SMTP id a200-20020a621ad1000000b005a8bdaecaa7mr8567689pfa.14.1677082665493;
        Wed, 22 Feb 2023 08:17:45 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id h23-20020aa786d7000000b005cc52ea452csm3633966pfo.100.2023.02.22.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 08:17:44 -0800 (PST)
Date: Wed, 22 Feb 2023 08:17:44 -0800 (PST)
X-Google-Original-Date: Wed, 22 Feb 2023 08:16:52 PST (-0800)
Subject: RISC-V Zbb QEMU Boot Failures (was Re: [PATCH v1] RISC-V: take text_mutex during alternative patching)
In-Reply-To: <20230222142743.a36qt4lgfq6zwd3c@orel>
CC: linux@roeck-us.net, heiko@sntech.de, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, samuel@sholland.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <mhng-b55c792d-9a59-4ce7-8913-ca2f480117f1@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_081748_662261_4246876D 
X-CRM114-Status: GOOD (  28.52  )
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

T24gV2VkLCAyMiBGZWIgMjAyMyAwNjoyNzo0MyBQU1QgKC0wODAwKSwgYWpvbmVzQHZlbnRhbmFt
aWNyby5jb20gd3JvdGU6Cj4gT24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgMDc6MzM6NTVBTSAtMDgw
MCwgR3VlbnRlciBSb2VjayB3cm90ZToKPj4gT24gMi8xNS8yMyAxNDowMCwgSGVpa28gU3TDvGJu
ZXIgd3JvdGU6Cj4+IFsgLi4uIF0KPj4gPgo+PiA+IFNvIG5vdyBJJ3ZlIGFsc28gdGVzdGVkIFBh
bG1lcidzIGZvci1uZXh0IGF0Cj4+ID4gICAgY29tbWl0IGVjNjMxMTkxOWVhNiAoIk1lcmdlIHBh
dGNoIHNlcmllcyAicmlzY3Y6IE9wdGltaXplIGZ1bmN0aW9uIHRyYWNlIiIpCj4+ID4KPj4gPiBh
Z2FpbiB3aXRoIHRoZSBzYW1lIHZhcmlhbnRzCj4+ID4gLSBxZW11LXJpc2N2MzIgd2l0aG91dCB6
YmIKPj4gPiAtIHFlbXUtcmlzY3YzMiB3aXRoIHpiYgo+PiA+IC0gcWVtdS1yaXNjdjY0IHdpdGhv
dXQgemJiCj4+ID4gLSBxZW11LXJpc2N2NjQgd2l0aCB6YmIKPj4gPgo+PiA+IEFuZCBhbGwgb2Yg
dGhlbSBib290ZWQgZmluZSBpbnRvIGEgbmZzLXJvb3QgKGRlYmlhbiBmb3IgcmlzY3Y2NCBhbmQg
YQo+PiA+IGJ1aWxkcm9vdCBmb3IgcmlzY3YzMikuCj4+ID4KPj4gPiBJIGV2ZW4gZm9yY2VkIGEg
YnVnIGludG8gdGhlIHpiYiBjb2RlIHRvIG1ha2Ugc3VyZSB0aGUgcGF0Y2hpbmcgd29ya2VkCj4+
ID4gY29ycmVjdGx5ICh3aGVyZSB0aGUga2VybmVsIGZhaWxlZCBhcyBleHBlY3RlZCkuCj4+ID4K
Pj4gPiBRZW11LXZlcnNpb24gZm9yIG1lIHdhcyA3LjIuNTAgKHY3LjIuMC03NDQtZzVhMzYzMzky
OWEtZGlydHkpCj4+ID4KPj4gPiBJIGRpZCB0cnkgdGhlIG9uZSBmcm9tIERlYmlhbi1zdGFibGUg
KHFlbXUtNS4yKSBidXQgdGhhdCB3YXMgdG9vIG9sZCBhbmQKPj4gPiBkaWRuJ3Qgc3VwcG9ydCBa
YmIgeWV0Lgo+PiA+Cj4+ID4gT25lIHRoaW5nIG9mIG5vdGUsIHRoZSAiYWN0aXZlIiAzMmJpdCBj
b25maWcgSSBoYWQsIHNvbWVob3cgZGlkbid0IHByb2R1Y2UKPj4gPiB3b3JraW5nIGltYWdlcyBh
bmQgSSBuZWVkZWQgdG8gc3RhcnQgYSBuZXcgYnVpbGQgdXNpbmcgdGhlIHJ2MzJfZGVmY29uZmln
Lgo+PiA+Cj4+ID4gU28gcmlnaHQgbm93LCBJJ20gbm90IHN1cmUgd2hhdCBtb3JlIHRvIHRlc3Qg
dGhvdWdoLgo+PiA+Cj4+Cj4+IEFub3RoZXIgZXhhbXBsZToKPj4KPj4gLSBidWlsZCBkZWZjb25m
aWcKPj4gLSBydW4KPj4gICBxZW11LXN5c3RlbS1yaXNjdjY0IC1NIHZpcnQgLW0gNTEyTSAtbm8t
cmVib290IC1rZXJuZWwgYXJjaC9yaXNjdi9ib290L0ltYWdlIFwKPj4gICAgIC1zbmFwc2hvdCAt
ZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWQwIC1kcml2ZSBmaWxlPXJvb3Rmcy5leHQy
LGlmPW5vbmUsaWQ9ZDAsZm9ybWF0PXJhdyBcCj4+ICAgICAtYXBwZW5kICJyb290PS9kZXYvdmRh
IGNvbnNvbGU9dHR5UzAsMTE1MjAwIGVhcmx5Y29uPXVhcnQ4MjUwLG1taW8sMHgxMDAwMDAwMCwx
MTUyMDAiIFwKPj4gICAgIC1ub2dyYXBoaWMgLW1vbml0b3Igbm9uZQo+Pgo+PiBXaXRoIENPTkZJ
R19SSVNDVl9JU0FfWkJCPXksIHRoYXQgcmVzdWx0cyBpbgo+Pgo+PiBbICAgIDAuODE4MjYzXSAv
ZGV2L3Jvb3Q6IENhbid0IG9wZW4gYmxvY2tkZXYKPj4gWyAgICAwLjgxODg1Nl0gVkZTOiBDYW5u
b3Qgb3BlbiByb290IGRldmljZSAiL2Rldi92ZGEiIG9yIHVua25vd24tYmxvY2soMCwwKTogZXJy
b3IgLTYKPj4gWyAgICAwLjgxOTE3N10gUGxlYXNlIGFwcGVuZCBhIGNvcnJlY3QgInJvb3Q9IiBi
b290IG9wdGlvbjsgaGVyZSBhcmUgdGhlIGF2YWlsYWJsZSBwYXJ0aXRpb25zOgo+PiBbICAgIDAu
ODE5ODA4XSBmZTAwICAgICAgICAgICAxNjM4NCB2ZGEKPj4gWyAgICAwLjgxOTk0NF0gIGRyaXZl
cjogdmlydGlvX2Jsawo+PiBbICAgIDAuODIwNTM0XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2lu
ZzogVkZTOiBVbmFibGUgdG8gbW91bnQgcm9vdCBmcyBvbiB1bmtub3duLWJsb2NrKDAsMCkKPj4g
WyAgICAwLjgyMTEwMV0gQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQg
Ni4yLjAtcmM4LW5leHQtMjAyMzAyMTYtMDAwMDItZzgwMzMyODI1ZTI0MCAjNAo+PiBbICAgIDAu
ODIxNjcyXSBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+IFsgICAgMC44
MjIwNTBdIENhbGwgVHJhY2U6Cj4+IFsgICAgMC44MjI0MjddIFs8ZmZmZmZmZmY4MDAwNTNlND5d
IGR1bXBfYmFja3RyYWNlKzB4MWMvMHgyNAo+PiBbICAgIDAuODIyODM0XSBbPGZmZmZmZmZmODA3
ZjkwZTQ+XSBzaG93X3N0YWNrKzB4MmMvMHgzOAo+PiBbICAgIDAuODIzMDg1XSBbPGZmZmZmZmZm
ODA4MDNhZWE+XSBkdW1wX3N0YWNrX2x2bCsweDNjLzB4NTQKPj4gWyAgICAwLjgyMzM1MV0gWzxm
ZmZmZmZmZjgwODAzYjE2Pl0gZHVtcF9zdGFjaysweDE0LzB4MWMKPj4gWyAgICAwLjgyMzYwMV0g
WzxmZmZmZmZmZjgwN2Y5NDRjPl0gcGFuaWMrMHgxMDIvMHgyOWUKPj4gWyAgICAwLjgyMzgzNF0g
WzxmZmZmZmZmZjgwYTAxNWUyPl0gbW91bnRfYmxvY2tfcm9vdCsweDE4Yy8weDIzZQo+PiBbICAg
IDAuODI0MTQ4XSBbPGZmZmZmZmZmODBhMDE4N2M+XSBtb3VudF9yb290KzB4MWU4LzB4MjE4Cj4+
IFsgICAgMC44MjQzOThdIFs8ZmZmZmZmZmY4MGEwMTllZT5dIHByZXBhcmVfbmFtZXNwYWNlKzB4
MTQyLzB4MTg0Cj4+IFsgICAgMC44MjQ2NTVdIFs8ZmZmZmZmZmY4MGEwMTE4Mj5dIGtlcm5lbF9p
bml0X2ZyZWVhYmxlKzB4MjM2LzB4MjVhCj4+IFsgICAgMC44MjQ5MzRdIFs8ZmZmZmZmZmY4MDgw
NDYwMj5dIGtlcm5lbF9pbml0KzB4MWUvMHgxMGEKPj4gWyAgICAwLjgyNTIwMV0gWzxmZmZmZmZm
ZjgwMDAzNTYwPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weDE2Cj4+IFsgICAgMC44MjYxODBd
IC0tLVsgZW5kIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBWRlM6IFVuYWJsZSB0byBtb3Vu
dCByb290IGZzIG9uIHVua25vd24tYmxvY2soMCwwKSBdLS0tCj4+Cj4+IFRoaXMgd29ya3MgZmlu
ZSBpZiBDT05GSUdfUklTQ1ZfSVNBX1pCQiBpcyBub3QgZW5hYmxlZC4KPj4KPj4gVGVzdGVkIHdp
dGggZ2NjIDExLjMsIGJpbnV0aWxzIDIuMzksIHFlbXUgdjcuMi4wIGFuZCBxZW11IGJ1aWx0IGZy
b20gbWFpbmxpbmUuCj4+Cj4KPiBKdXN0IHRvICsxIHRoaXMsIEkgZ2V0IHRoZSBzYW1lIHJlc3Vs
dCAodW5hYmxlIHRvIG1vdW50IHJvb3QgZnMpIHdpdGgKPgo+ICRRRU1VIC1jcHUgcnY2NCx6YmI9
b24gXAo+ICAgICAgICAgLW5vZ3JhcGhpYyBcCj4gICAgICAgICAtbWFjaGluZSB2aXJ0IFwKPiAg
ICAgICAgIC1rZXJuZWwgJEtFUk5FTCBcCj4gICAgICAgICAtYXBwZW5kICdyb290PS9kZXYvdmRh
IGNvbnNvbGU9dHR5UzAnIFwKPiAgICAgICAgIC1kcml2ZSBmaWxlPWRpc2suZXh0NCxmb3JtYXQ9
cmF3LGlkPWhkMCBcCj4gICAgICAgICAtZGV2aWNlIHZpcnRpby1ibGstcGNpLGRyaXZlPWhkMAo+
Cj4ga2VybmVsOiAgIGxhdGVzdCByaXNjdi1saW51eC9mb3ItbmV4dCAoODY1OGRiMGE0YTBmKSwg
ZGVmY29uZmlnCj4gZ2NjOiAgICAgIHJpc2N2LWdudS10b29sY2hhaW4gKDEyLjEuMCkKPiBiaW51
dGlsczogcmlzY3YtZ251LXRvb2xjaGFpbiAoMi4zOSkKPiBxZW11OiAgICAgbGF0ZXN0IG1hc3Rl
ciAoNzliNjc3ZDY1OGQzKQo+Cj4gRmxpcHBpbmcgdGhlIFFFTVUgY3B1IHpiYiBwcm9wZXJ0eSBv
ZmYgYWxsb3dzIGJvb3QgdG8gc3VjY2VlZCwgaS5lLiBpdCdzCj4gbm90IG5lY2Vzc2FyeSB0byBj
b21waWxlIG91dCB0aGUgQ09ORklHX1JJU0NWX0lTQV9aQkIgY29kZSBmcm9tIHRoZQo+IGtlcm5l
bCwgaXQncyBqdXN0IG5lY2Vzc2FyeSB0byBhdm9pZCB1c2luZyBpdC4KClRoYW5rcyBmb3IgZmlu
ZGluZyB0aGlzLiAgSSdtIGNoYW5naW5nIHRoZSBzdWJqZWN0IGxpbmUgYW5kIGFkZGluZyBQYXVs
LCAKYXMgaXQgY2FtZSB1cCBkdXJpbmcgdGhlIHBhdGNod29yayBjYWxsLiAgSSBhZGRlZCB6YmI9
b24gZm9yIHJ2MzIgYW5kIApydjY0IHRvIG15IHRlc3RzIGFuZCB0aGV5IHBhc3MsIGJ1dCBJJ20g
bm90IG1vdW50aW5nIGEgcm9vdGZzLi4uCgo+Cj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
