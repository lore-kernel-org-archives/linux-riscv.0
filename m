Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B40C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5nLFKCfwTfhH2mN/bFJPmjq0TshMiYDhJRc2v+LVlg=; b=4pe7wlCUxQcKdr
	z4xR82mF+odqu4ZEU2NemQKbwuHdzsBsJDSQcc0+m4XsyOiZXIaw3UtSy5fVrpAxVWJ4ZKoRW+3F3
	iGSVQ9UDsTffHGkpq1WkVne+FoRvhn5bSi7zaCG+e1BUZm7LKFqQjxeamS/rjf+Q/7AdsW9PsNxY2
	lI1Tqjgj5i9aRhO4XDv82dlVKgV843EdIn6ytzmu4WTimNJviB2RqgTkjO7SyvZhUeymJCeEauEtj
	+P36aq7lDHr034j40o1P/wP3qdGlLO0NcVDmaXhVY8KKqJ7sOH+/Rn1aic4UV6K6xTUVS8/oG6Jht
	pTaXmmRUHaU4twES1rKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Qqz-001EeT-1n;
	Fri, 26 May 2023 06:23:09 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Qqw-001EcO-33;
	Fri, 26 May 2023 06:23:08 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5307502146aso246621a12.1;
        Thu, 25 May 2023 23:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685082183; x=1687674183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cCHBf3UytwZfxePPwE+jd6ort0sOdXbbuo1VvBkL64=;
        b=In9JMr9pXJKdU4OFNrKA8VkqvzNERFgbkF1WTefIBpZGNH1cm6Wu4vy6gHMfTTbpH5
         Bxt1r4RdI0sl2apwFfU9YncceU9jlq55r9HxXRy93MWRcYsVcXQ/3fCBv5QBexNmd25X
         6G2yWYoM0MVRHQMx8eH0pxaCBL360ys2TBubCUiYCToafZ9wgibDjDx0qVGg1QlxwNOJ
         mLFF8yI2zd7UosSjjmAmMe1b3OntVisxuNwReKnyR4cjSdQqdBe57OFiu7V+h7YbDTD9
         gS4FVXbZxLBVK9nWMBpD7mMOq0v4voFCeypL5pXo+ai/vZiKklNlarHEiS6wZWvQStAQ
         076A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685082183; x=1687674183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cCHBf3UytwZfxePPwE+jd6ort0sOdXbbuo1VvBkL64=;
        b=cckb4fLGHQciem7PwdyEPU93KHJtHMWD4fUo+hvE+oxCw+gf3dNgkUYe9/b3bZiB5J
         dwpghJGFbZNFeOa3QP6h6eRmg9OoNRq2FncYdl60OJlYJmP0N+7M9ij6rBuI60d0UsUX
         qww5LzmSmla5/hJ9bZ2ehJGWIpGEZrTH54vAE2vu0sLbOu8DLCn/9/n3W4W2GVKZMXb5
         pwf2kncrKmzqjwUT2VyFK7ve5gCCf64KBndjBFTK38wwbPMKeE5bM6aZ5oIsGQyxUHry
         ORLDn0c+9dk6DIUunkC2TCGkjM7vayZz0ioeBuzsXUfbsPnfRjWCd2+IivIstFhuGuca
         wHLA==
X-Gm-Message-State: AC+VfDzDLDNs4ZzbTTXhQOer//YCnUvB3G2yFfSpSbtNE55a9P0nyMdK
	9ZZgE42utyXvcJMfUKzLcQnvh6aiggjetTcUlUw=
X-Google-Smtp-Source: ACHHUZ5+adpq5bn8ccEuSJ16UorMQ11HQo3chgEmsUz3XwrAAvurJ6sIX+3y8mXx79RuaBedX3HqgDmU0iivyP2H1/M=
X-Received: by 2002:a17:903:2285:b0:1ab:142a:3dd7 with SMTP id
 b5-20020a170903228500b001ab142a3dd7mr1537487plh.68.1685082183465; Thu, 25 May
 2023 23:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684999824.git.haibo1.xu@intel.com> <20230525-6e0855eb07086a96eaa82362@orel>
In-Reply-To: <20230525-6e0855eb07086a96eaa82362@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 26 May 2023 14:22:52 +0800
Message-ID: <CAJve8o=SdjMvsVn=3Vqw3QG5SuU8nqLVC_MRAgPX+GuFZj6jvA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] RISCV: Add KVM_GET_REG_LIST API
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_232306_981403_210F7834 
X-CRM114-Status: GOOD (  16.72  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMToyMOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDM6Mzg6
MjRQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBLVk1fR0VUX1JFR19MSVNUIHdpbGwgZHVt
cCBhbGwgcmVnaXN0ZXIgSURzIHRoYXQgYXJlIGF2YWlsYWJsZSB0bwo+ID4gS1ZNX0dFVC9TRVRf
T05FX1JFRyBhbmQgSXQncyB2ZXJ5IHVzZWZ1bCB0byBpZGVudGlmeSBzb21lIHBsYXRmb3JtCj4g
PiByZWdyZXNzaW9uIGlzc3VlIGR1cmluZyBWTSBtaWdyYXRpb24uCj4gPgo+ID4gUGF0Y2ggMS03
IHJlLXN0cnVjdHVyZWQgdGhlIGdldC1yZWctbGlzdCB0ZXN0IGluIGFhcmNoNjQgdG8gbWFrZSBz
b21lCj4gPiBvZiB0aGUgY29kZSBhcyBjb21tb24gdGVzdCBmcmFtZXdvcmsgdGhhdCBjYW4gYmUg
c2hhcmVkIGJ5IHJpc2N2Lgo+ID4KPiA+IFBhdGNoIDggZW5hYmxlZCB0aGUgS1ZNX0dFVF9SRUdf
TElTVCBBUEkgaW4gcmlzY3YgYW5kIHBhdGNoIDktMTEgYWRkZWQKPiA+IHRoZSBjb3JyZXNwb25k
aW5nIGtzZWxmdGVzdCBmb3IgY2hlY2tpbmcgcG9zc2libGUgcmVnaXN0ZXIgcmVncmVzc2lvbnMu
Cj4gPgo+ID4gVGhlIGdldC1yZWctbGlzdCBrdm0gc2VsZnRlc3Qgd2FzIHBvcnRlZCBmcm9tIGFh
cmNoNjQgYW5kIHRlc3RlZCB3aXRoCj4gPiBMaW51eCA2LjQtcmMxIG9uIGEgUWVtdSByaXNjdiB2
aXJ0IG1hY2hpbmUuCj4gPgo+ID4gLS0tCj4gPiBDaGFuZ2VkIHNpbmNlIHYxOgo+ID4gICAqIHJl
YmFzZSB0byBBbmRyZXcncyBjaGFuZ2VzCj4gPiAgICogZml4IGNvZGluZyBzdHlsZQo+ID4KPiA+
IEFuZHJldyBKb25lcyAoNyk6Cj4gPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogUmVwbGFjZSBz
dHJfd2l0aF9pbmRleCB3aXRoIHN0cmR1cF9wcmludGYKPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRl
c3RzOiBEcm9wIFNWRSBjYXAgY2hlY2sgaW4gcHJpbnRfcmVnCj4gPiAgIEtWTTogYXJtNjQ6IHNl
bGZ0ZXN0czogUmVtb3ZlIHByaW50X3JlZydzIGRlcGVuZGVuY3kgb24gdmNwdV9jb25maWcKPiA+
ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBSZW5hbWUgdmNwdV9jb25maWcgYW5kIGFkZCB0byBr
dm1fdXRpbC5oCj4gPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogRGVsZXRlIGNvcmVfcmVnX2Zp
eHVwCj4gPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogU3BsaXQgZ2V0LXJlZy1saXN0IHRlc3Qg
Y29kZQo+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IEZpbmlzaCBnZW5lcmFsaXppbmcgZ2V0
LXJlZy1saXN0Cj4KPiBBbGwgdGhlIHBhdGNoZXMgYWJvdmUgc2hvdWxkIGFsc28gaGF2ZSB5b3Vy
IHMtby1iIHNpbmNlIHlvdXIgcG9zdGluZyB0aGVtLgo+CgpTdXJlLgoKPiBUaGFua3MsCj4gZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
