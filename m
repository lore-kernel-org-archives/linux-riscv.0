Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA23C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 05:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctKG6okPOFI4V5yMoqEaFXgksXQIBXVkBlJWiRBfcy0=; b=xi2r0kBoM3f5tp
	Ad9ta8puiBcg5lAXu7UfejFjp6W5ImQpKAaBIOP3ugxDNWNZsfqwvqKB0gWgJ47xh+N4MsjL1FGNJ
	KnilaRWGxN++1FK3hXLT56pXIOTN/rTVrzYSpU0XekX3HQbB0dhEwykeDlZAvLsM28shK9K5uPjzA
	Dp3U/4jV/4lySYUE1EPQ3+NzK61GE2qhRRQbgS/DS8BmIBDMRBhOaTJ3qMDMGGb7RJFvP7Z3xONC8
	MPA/0Ja/kOBU94/xalmlz6HWNcv/yR0LA4EkwzpEo0n91L1LMFwth7lyx79CB75f6VxN5MrGpKmf3
	HbVH5Ag/nOuzhVUxXBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odPSe-00E3IG-RQ; Wed, 28 Sep 2022 05:18:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odPSb-00E3HD-LC; Wed, 28 Sep 2022 05:18:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 211586153A;
	Wed, 28 Sep 2022 05:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F171AC43142;
	Wed, 28 Sep 2022 05:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664342295;
	bh=5DT/64IMZuLUf3bLjAXjRk8ANx+zPNw/RU/6k9PgsEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P8byIOIt7uszvxLcdgywqcHiRI5onE8KrFWRs0OjZ77PSPshjHTTFsEP/cTrlgaeK
	 Pci26+wFWN3XKzRusZOuQY2zcXw3ErF6Z+L+QS85fZIYDJqX7ssHqAKVWr/yRrJDo5
	 Ink5CiFgQHiXTzMHaUFBqzXiZhI2vhYB7zUNok41Ioco0o1eeW0+SjXZxq0kD3T8ru
	 fUQgHjK4KX6zhf9lYRL+A7/y2KmepExQsJOdlXaFFw27Rab8Q2wVEKTotqBKeFZGyv
	 bDkZ2Z5ISScP0pPq+Gd7XqFbfveixPMBvIvzbL6uOXF1hUCPdXu9euodemk1Za1Lvt
	 las6ropjYeS9g==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1319cf91d8aso2015295fac.5;
        Tue, 27 Sep 2022 22:18:14 -0700 (PDT)
X-Gm-Message-State: ACrzQf3oywnpNsxP8ASM4GwXfO9EfUVPohiwcU39OjI/yVnV6bALFJqH
	DKaZPxW5IFzWJ5ZP3GNkXZl0fgGjOIPIChJ6x2s=
X-Google-Smtp-Source: AMsMyM5GSVNd2f83vHIh/hPg2DnFINuapn47E77DPLXPMrUPF4ddplCTXJHsTyIzOXryyZpiPMMe1L6pEq8/FDU8J9I=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr4211405oap.19.1664342294051; Tue, 27 Sep
 2022 22:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220925162400.1606-1-jszhang@kernel.org> <20220925162400.1606-2-jszhang@kernel.org>
In-Reply-To: <20220925162400.1606-2-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 28 Sep 2022 13:18:01 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRSb4f9rF_sTZ2hr9iOnvLYcQYu3CN7q8PCZQg4HvC_Gg@mail.gmail.com>
Message-ID: <CAJF2gTRSb4f9rF_sTZ2hr9iOnvLYcQYu3CN7q8PCZQg4HvC_Gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] RISC-V: KVM: Record number of signal exits as a
 vCPU stat
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_221817_812580_AC2FD2A7 
X-CRM114-Status: GOOD (  17.52  )
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

UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoK4p6cICBsaW51eCBnaXQ6
KG1hc3RlcikgZ3JlcCBzaWduYWxfZXhpdHMgYXJjaC9hcm02NCAtcgphcmNoL2FybTY0L2t2bS9n
dWVzdC5jOiBTVEFUU19ERVNDX0NPVU5URVIoVkNQVSwgc2lnbmFsX2V4aXRzKSwKYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9rdm1faG9zdC5oOiAgICAgIHU2NCBzaWduYWxfZXhpdHM7CgpCeSB0aGUg
d2F5LCBkbyB5b3Uga25vdyB3aHkgYXJtNjQgaXMgZGVmaW5lZCwgYnV0IG5vdCB1c2VkPwoKCk9u
IE1vbiwgU2VwIDI2LCAyMDIyIGF0IDEyOjMzIEFNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBSZWNvcmQgYSBzdGF0aXN0aWMgaW5kaWNhdGluZyB0aGUgbnVt
YmVyIG9mIHRpbWVzIGEgdkNQVSBoYXMgZXhpdGVkCj4gZHVlIHRvIGEgcGVuZGluZyBzaWduYWwu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4g
LS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDEgKwo+ICBhcmNoL3Jp
c2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXggNjBjNTE3
ZTRkNTc2Li5kYmJmNDNkNTI2MjMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4g
QEAgLTY3LDYgKzY3LDcgQEAgc3RydWN0IGt2bV92Y3B1X3N0YXQgewo+ICAgICAgICAgdTY0IG1t
aW9fZXhpdF9rZXJuZWw7Cj4gICAgICAgICB1NjQgY3NyX2V4aXRfdXNlcjsKPiAgICAgICAgIHU2
NCBjc3JfZXhpdF9rZXJuZWw7Cj4gKyAgICAgICB1NjQgc2lnbmFsX2V4aXRzOwo+ICAgICAgICAg
dTY0IGV4aXRzOwo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IGQwZjA4ZDViNDI4Mi4uM2RhNDU5ZmVkYzI4
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYwo+IEBAIC0yOCw2ICsyOCw3IEBAIGNvbnN0IHN0cnVjdCBfa3ZtX3N0YXRzX2Rl
c2Mga3ZtX3ZjcHVfc3RhdHNfZGVzY1tdID0gewo+ICAgICAgICAgU1RBVFNfREVTQ19DT1VOVEVS
KFZDUFUsIG1taW9fZXhpdF9rZXJuZWwpLAo+ICAgICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZD
UFUsIGNzcl9leGl0X3VzZXIpLAo+ICAgICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGNz
cl9leGl0X2tlcm5lbCksCj4gKyAgICAgICBTVEFUU19ERVNDX0NPVU5URVIoVkNQVSwgc2lnbmFs
X2V4aXRzKSwKPiAgICAgICAgIFNUQVRTX0RFU0NfQ09VTlRFUihWQ1BVLCBleGl0cykKPiAgfTsK
Pgo+IEBAIC05NzMsNiArOTc0LDcgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfcnVuKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAgICAgaWYgKHNpZ25hbF9wZW5kaW5nKGN1
cnJlbnQpKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlRSOwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHJ1bi0+ZXhpdF9yZWFzb24gPSBLVk1fRVhJVF9JTlRSOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICsrdmNwdS0+c3RhdC5zaWduYWxfZXhpdHM7Cj4gICAgICAg
ICAgICAgICAgIH0KPgo+ICAgICAgICAgICAgICAgICAvKgo+IC0tCj4gMi4zNC4xCj4KCgotLQpC
ZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
