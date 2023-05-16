Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7AEC77B7D
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 03:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9bwRyQJ6YAm5fZySJga2D7lJMCaUH6iDbcj45QKsDY=; b=EpKpLSXBsvoX2W
	z29d7iHTRJJo2d79TkelwmSQVCDu37mwnPVugNra5p+LZf/kvh9Wv4EfF2UyfRHQRj5lYyfGLzi2g
	iZGVaZxJmm0cXDbP2vQ+HeuprIGLNefYoK2GY+3ShuWZdRUKZlh6g3oH5IdkYSP6Pe3+z+tWCquqZ
	jB6m0qabePuYjDyLhcfuvvCwPdFcSSqiFV1RSaZrWLJAY138SvDsap/02ac60HpdVnY2Q8KQKt/8G
	a638K+MMzm0HEyDO46aWtXH2jFvu7vthsBFzGnqCatOqKnnrm5DUK1avu8oSb+lMMdQKwww+pwp5t
	WlPQW1CQKCqbUdr6DwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyl9o-004Dqh-1J;
	Tue, 16 May 2023 03:15:24 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyl9l-004Dpt-1O
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 03:15:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f24ddf514eso11907750e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 May 2023 20:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684206920; x=1686798920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bl+t8tHUGXHrqDdO1CHQdBE7Nio53ARCR1K6a8BjQJM=;
        b=QDSmAjGaG02MDvl0QOYVYtwVBSIYvuiSE3o7PLY2ctKCNKB5+ENkBZxLYfsGO0yIEe
         EKvIUQK5D7FDP0pRrs31heyd9tjBX0Ol3gXhaGL+ZkC/JOrdkIBHYfoFH+0r9wpfncrx
         QMN+6Qs9vrttLKpaq0X9C+pqbc3Hh0chy3u8W9wZM2M4SWdzgOS3pupmXObX/LdQI6uk
         h4Ir7o76eLpMebje7u5vup9e+RdIAYBjjtNOzBf69BK+bhXsz6gLkhPFsVlHprWAjfUA
         amrDGqVbJwR1DiMpV5F3TWSIeu2O1Y7pRm9fgzGuuSEsHyDCEBvxk3H0jEpYTElvJJvy
         HWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684206920; x=1686798920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bl+t8tHUGXHrqDdO1CHQdBE7Nio53ARCR1K6a8BjQJM=;
        b=MMGO1iyyNU58tFvIH3RCSiLU9Sw4HxSkOVdTlWZGgp0C/uH6l0/8qywkriMu+dty/W
         BuAc+S8azdjp8D9sbo5DHu25vMtFKvQZkwlK8sPPRmJGrfKiG2XOd+ihSwOjy8Mimbn2
         k9npcfqrAVPotCYqYYtaTzTPqg2Dz3zjhOrkdPgbymCe/5vFlrqZPyTcyGYVNCBp1LLb
         5Zd7wCbdHjspDcVAVl5/7QroNDBYdqYzNlDXnBRRKu3ciqg9ZqedJKGd8k8hN3xcQiyS
         HbRxmfqGbM8berGEDB/xqHhSC7gIWMXzxWPlQ4Q04vtGVsYEz9CsEihgYH4sD8T17xs3
         I3qQ==
X-Gm-Message-State: AC+VfDxRAOU+IXT/OkOQIddDjILzfH04/T4Grnoit9nUAO4KmiSz7IqI
	tkrRXz2ge2Bh8lDOGBcJGtfo82hj+LlRU7/llqcXVw==
X-Google-Smtp-Source: ACHHUZ6JUxopVpBE88qqEZ5JgPzNfhH8+JbSBHjancbpmQh2v+I4RepO2FFjvtV91quS6KuiypieGyHjzb6rz48gfsQ=
X-Received: by 2002:ac2:47f4:0:b0:4ef:f017:e52 with SMTP id
 b20-20020ac247f4000000b004eff0170e52mr7660035lfp.5.1684206919728; Mon, 15 May
 2023 20:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230509103033.11285-5-andy.chiu@sifive.com> <mhng-18df71ab-832b-4312-9319-52ae8b3da0d8@palmer-ri-x1c9a>
In-Reply-To: <mhng-18df71ab-832b-4312-9319-52ae8b3da0d8@palmer-ri-x1c9a>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 16 May 2023 11:15:08 +0800
Message-ID: <CABgGipUfekA2fHVz4L3EzynF-rVMwTJpGBcusWwXXAon3pZLYA@mail.gmail.com>
Subject: Re: [PATCH -next v19 04/24] riscv: Add new csr defines related to
 vector extension
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	vincent.chen@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_201521_484582_705D19DE 
X-CRM114-Status: GOOD (  14.58  )
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

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgNjo1NuKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAwOSBNYXkgMjAyMyAwMzozMDoxMyBQRFQg
KC0wNzAwKSwgYW5keS5jaGl1QHNpZml2ZS5jb20gd3JvdGU6Cj4gPiBGcm9tOiBHcmVlbnRpbWUg
SHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4KPiA+IEZvbGxvdyB0aGUgcmlzY3YgdmVj
dG9yIHNwZWMgdG8gYWRkIG5ldyBjc3IgbnVtYmVycy4KPiA+Cj4gPiBBY2tlZC1ieTogR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiBDby1kZXZlbG9wZWQtYnk6IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBs
aW51eC5hbGliYWJhLmNvbT4KPiA+IENvLWRldmVsb3BlZC1ieTogVmluY2VudCBDaGVuIDx2aW5j
ZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmlu
Y2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHcmVlbnRpbWUgSHUgPGdy
ZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAcml2b3NpbmMuY29tPgo+ID4gU3VnZ2VzdGVkLWJ5OiBWaW5lZXQgR3VwdGEgPHZpbmVl
dGdAcml2b3NpbmMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVA
c2lmaXZlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVl
Ym5lckB2cnVsbC5ldT4KPiA+IFRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVi
bmVyQHZydWxsLmV1Pgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8
IDE4ICsrKysrKysrKysrKysrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ID4gaW5kZXggYjZh
Y2I3ZWQxMTVmLi5iOThiM2I2YzlkYTIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gPiBA
QCAtMjQsMTYgKzI0LDI0IEBACj4gPiAgI2RlZmluZSBTUl9GU19DTEVBTiAgX0FDKDB4MDAwMDQw
MDAsIFVMKQo+ID4gICNkZWZpbmUgU1JfRlNfRElSVFkgIF9BQygweDAwMDA2MDAwLCBVTCkKPiA+
Cj4gPiArI2RlZmluZSBTUl9WUyAgICAgICAgICAgICAgICBfQUMoMHgwMDAwMDYwMCwgVUwpIC8q
IFZlY3RvciBTdGF0dXMgKi8KPiA+ICsjZGVmaW5lIFNSX1ZTX09GRiAgICBfQUMoMHgwMDAwMDAw
MCwgVUwpCj4gPiArI2RlZmluZSBTUl9WU19JTklUSUFMICAgICAgICBfQUMoMHgwMDAwMDIwMCwg
VUwpCj4gPiArI2RlZmluZSBTUl9WU19DTEVBTiAgX0FDKDB4MDAwMDA0MDAsIFVMKQo+ID4gKyNk
ZWZpbmUgU1JfVlNfRElSVFkgIF9BQygweDAwMDAwNjAwLCBVTCkKPiA+ICsKPiA+ICAjZGVmaW5l
IFNSX1hTICAgICAgICAgICAgICAgIF9BQygweDAwMDE4MDAwLCBVTCkgLyogRXh0ZW5zaW9uIFN0
YXR1cyAqLwo+ID4gICNkZWZpbmUgU1JfWFNfT0ZGICAgIF9BQygweDAwMDAwMDAwLCBVTCkKPiA+
ICAjZGVmaW5lIFNSX1hTX0lOSVRJQUwgICAgICAgIF9BQygweDAwMDA4MDAwLCBVTCkKPiA+ICAj
ZGVmaW5lIFNSX1hTX0NMRUFOICBfQUMoMHgwMDAxMDAwMCwgVUwpCj4gPiAgI2RlZmluZSBTUl9Y
U19ESVJUWSAgX0FDKDB4MDAwMTgwMDAsIFVMKQo+ID4KPiA+ICsjZGVmaW5lIFNSX0ZTX1ZTICAg
ICAoU1JfRlMgfCBTUl9WUykgLyogVmVjdG9yIGFuZCBGbG9hdGluZy1Qb2ludCBVbml0ICovCj4g
PiArCj4gPiAgI2lmbmRlZiBDT05GSUdfNjRCSVQKPiA+IC0jZGVmaW5lIFNSX1NEICAgICAgICAg
ICAgICAgIF9BQygweDgwMDAwMDAwLCBVTCkgLyogRlMvWFMgZGlydHkgKi8KPiA+ICsjZGVmaW5l
IFNSX1NEICAgICAgICAgICAgICAgIF9BQygweDgwMDAwMDAwLCBVTCkgLyogRlMvVlMvWFMgZGly
dHkgKi8KPiA+ICAjZWxzZQo+ID4gLSNkZWZpbmUgU1JfU0QgICAgICAgICAgICAgICAgX0FDKDB4
ODAwMDAwMDAwMDAwMDAwMCwgVUwpIC8qIEZTL1hTIGRpcnR5ICovCj4gPiArI2RlZmluZSBTUl9T
RCAgICAgICAgICAgICAgICBfQUMoMHg4MDAwMDAwMDAwMDAwMDAwLCBVTCkgLyogRlMvVlMvWFMg
ZGlydHkgKi8KPiA+ICAjZW5kaWYKPiA+Cj4gPiAgI2lmZGVmIENPTkZJR182NEJJVAo+ID4gQEAg
LTM3NSw2ICszODMsMTIgQEAKPiA+ICAjZGVmaW5lIENTUl9NVklQSCAgICAgICAgICAgIDB4MzE5
Cj4gPiAgI2RlZmluZSBDU1JfTUlQSCAgICAgICAgICAgICAweDM1NAo+ID4KPiA+ICsjZGVmaW5l
IENTUl9WU1RBUlQgICAgICAgICAgIDB4OAo+ID4gKyNkZWZpbmUgQ1NSX1ZDU1IgICAgICAgICAg
ICAgMHhmCj4gPiArI2RlZmluZSBDU1JfVkwgICAgICAgICAgICAgICAgICAgICAgIDB4YzIwCj4g
PiArI2RlZmluZSBDU1JfVlRZUEUgICAgICAgICAgICAweGMyMQo+ID4gKyNkZWZpbmUgQ1NSX1ZM
RU5CICAgICAgICAgICAgMHhjMjIKPiA+ICsKPiA+ICAjaWZkZWYgQ09ORklHX1JJU0NWX01fTU9E
RQo+ID4gICMgZGVmaW5lIENTUl9TVEFUVVMgIENTUl9NU1RBVFVTCj4gPiAgIyBkZWZpbmUgQ1NS
X0lFICAgICAgICAgICAgICBDU1JfTUlFCj4KPiBSZXZpZXdlZC1ieTogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckByaXZvc2luYy5jb20+CgpUaGlzIHBhdGNoIGFsc28gaGFzIHlvdXIgUi1iIGFuZCBo
YXMgbm90IGJlZW4gY2hhbmdlZCBzaW5jZSB2MTMuCgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
