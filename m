Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EEECA0EEB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urCNrFvYr8TcyuwFdFbytVU0JL5/zJT7QTDXtawKuTE=; b=bfr7n3aHeQWlwq
	QPvVqtabP48x/Gp00HN4jTfJKElzfF2mO6DLLaoIS83DzuFYr9bv//DTmGXK4luIgeCVWBLAw3qzH
	2F8z0LsX3DU9BDRUEc0Rmh/LKNjjycmPBm108wmkmVOO8M/gMnPQ1zyVRXWESUGJRMjLckRpPoNix
	i0+oAMV0OxtpVtWLG7oFnJSBU/tAnv+nC2dXDwlcabSc+gAg50fGgnltyszESoE9PWv2Q6WVNFbYD
	9kNfq+nXlnyyu91ufkNkTudbLWDa36NV3Uj3S5O5Dm0UTEhxymQ84+bLaYwoih/SYHSDNPjyfk7oi
	nmuOzr8hgJUi2xHDKumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0qI-00000007kU4-1GSi;
	Mon, 18 Aug 2025 14:28:10 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0hI-00000007iw3-3Kwf
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 14:18:54 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e57010c2bbso25993755ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1755526731; x=1756131531; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYOfhNBP3fLXotYDWFjRKcPRzvbpTIEaDDDJFw248X4=;
        b=dO87jwXKQzUReBDVEU3vaDHd1niGdzxb/6vqeJOGqNsH8iQE2JiV80Ad3usSb/xzns
         fCkeibEyVidMTCHzkOpiHdS4pN2ufvGZhgY6iEDI/lOzlUsXxh4f177JdVx6qmzXNava
         cdyi/zM9OyXAjTt/iJ3e5PDW9bBaa2AI59BPhhzJj7TBFdJph2N9ngi/UA5aahZEzGKs
         aUXby80QszufjUCSm+tvswPgrdeKFRRRqEyOH2Z5FhXlgzozBfIh9EONFBFCGN6ipQim
         e+cjhiQbouv28elIERkHRkAr0NDQWAf1wGxaGU4xGkYwqdkdNWn5sfOY5sa6RGKgxNk5
         43/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755526731; x=1756131531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYOfhNBP3fLXotYDWFjRKcPRzvbpTIEaDDDJFw248X4=;
        b=AZ5lJCird9HavZ9xfRia/rNRshU0oNv7pyULUUUktXcYNkshamr4TQ2SI6J9jiyTAQ
         KAYz/C6CuRu1ZMvrQsc5UHta8DotnWo5aFh+9Y4FFMnCduNORpbvAAzWL9vPW5r8ySuS
         ff0q1KGEdIn4VS1o5NxAfZehiNOjh4zygeZMS1xSGhb5MoLv7uPKbaz5hqcBs+ExIyG4
         LJpcNokY/25LOhb5A4Uz3cdNAHnYSX+Ey01GFbdsZDq2/cIFAgYFGDN5zyke/LD0xCL+
         9oGKE4kagzoyyoOVvd97D0AtIETD4eXp/ChnawsSIB/ajsHaYacVMCcvmQIpQLJdduNl
         RVcw==
X-Forwarded-Encrypted: i=1; AJvYcCWJGSsa6Fpf2Nh7GEKVlBWLTuPvsxeakyKc5Hqn6LTgddInucns1b3VzqoliHT9BwUjWBLC6LPTHpGDzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPk5bGy+Ezj3zkfmhN0eqcHEn9r0dmIHKVOJUIhO02gjuQfmpq
	JBRjtQxlHayPqjFWoZkyb8DsewcrPYJsMureYlVyvdMWVP8G/201R5AZ7YZRjihkwP7rsMqjx8p
	6bIPBzrRhE0CjzsKlUfMu+4eJ9wg0vc3HQN6r9wvGjX2XLncvNXWl
X-Gm-Gg: ASbGncsNdkLm+osO0MdLy4BbnR0O9+p7Gx8e+c5wwBddGOnhsp55/cogF6oQvLtjFa6
	KK0k4t90yXDw3fh0dXyo4CBfEGaBU0S7Dg+M//WNerVD7BZwlw4rvPgBib1uU6wnitBZ5jLeBMh
	b0iYb8RxS4v036nXFP1pTE9pjRbm94nePR+mhJxF4poO/4s6szRswCY9OponcHMgB95MSEvrKMK
	R2zkKU4
X-Google-Smtp-Source: AGHT+IFj/CqMCPnATLcRtW5vpKziqlXbmXhL2wmmOXkawwJHhjlum+QCcKdXnS+PQpPXSzExCCtbyPz6bmKR709p8ek=
X-Received: by 2002:a05:6e02:2148:b0:3e5:3ce4:6953 with SMTP id
 e9e14a558f8ab-3e57e9c4a78mr180851065ab.22.1755526731206; Mon, 18 Aug 2025
 07:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250807070729.89701-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20250807070729.89701-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Aug 2025 19:48:39 +0530
X-Gm-Features: Ac12FXxG0RSI1dIc2x76x-tlkVbmLS809vZnHg6zH0-npCpI10lDp4FSEF7jb90
Message-ID: <CAAhSdy3omyk7YGVHNV5mgR13cON1SxdpqsxGQJsWWE1Hoyw=5A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Using user-mode pte within kvm_riscv_gstage_ioremap
To: fangyu.yu@linux.alibaba.com
Cc: atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@linux.alibaba.com, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_071852_995377_7FF5F268 
X-CRM114-Status: GOOD (  19.65  )
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

T24gVGh1LCBBdWcgNywgMjAyNSBhdCAxMjozN+KAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBDdXJyZW50bHkgd2UgdXNlIGt2bV9yaXNjdl9nc3RhZ2VfaW9yZW1hcCB0byBt
YXAgSU1TSUMgZ3BhIHRvIHRoZSBzcGEgb2YKPiBndWVzdCBpbnRlcnJ1cHQgZmlsZSB3aXRoaW4g
SU1TSUMuCj4KPiBUaGUgUEFHRV9LRVJORUxfSU8gcHJvcGVydHkgZG9lcyBub3QgaW5jbHVkZSB1
c2VyIG1vZGUgc2V0dGluZ3MsIHNvIHdoZW4KPiBhY2Nlc3NpbmcgdGhlIElNU0lDIGFkZHJlc3Mg
aW4gdGhlIHZpcnR1YWwgbWFjaGluZSwgIGEgIGd1ZXN0IHBhZ2UgZmF1bHQKPiB3aWxsIG9jY3Vy
LCB0aGlzIGlzIG5vdCBleHBlY3RlZC4KPgo+IEFjY29yZGluZyB0byB0aGUgUklTQy1WIFByaXZp
bGVnZWQgQXJjaGl0ZWN0dXJlIFNwZWMsIGZvciBHLXN0YWdlIGFkZHJlc3MKPiB0cmFuc2xhdGlv
biwgYWxsIG1lbW9yeSBhY2Nlc3NlcyBhcmUgY29uc2lkZXJlZCB0byBiZSB1c2VyLWxldmVsIGFj
Y2Vzc2VzCj4gYXMgdGhvdWdoIGV4ZWN1dGVkIGluIFVtb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
RmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+CgpPdmVyYWxsLCBhIGdvb2Qg
Zml4LiBUaGFua3MhCgpUaGUgcGF0Y2ggc3ViamVjdCBhbmQgZGVzY3JpcHRpb24gbmVlZHMgaW1w
cm92ZW1lbnRzLiBBbHNvLCB0aGVyZSBpcyBubwpGaXhlcyB0YWcgd2hpY2ggaXMgcmVxdWlyZWQg
Zm9yIGJhY2twb3J0aW5nLgoKSSBoYXZlIHRha2VuIGNhcmUgb2YgdGhlIGFib3ZlIHRoaW5ncyBh
dCB0aGUgdGltZSBvZiBtZXJnaW5nIHRoaXMgcGF0Y2guCgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBm
aXhlcyBmb3IgTGludXgtNi4xNwoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS9tbXUuYyB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gv
cmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMTA4N2VhNzQ1NjdiLi44MDAwNjRlOTZlZjYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUu
Ywo+IEBAIC0zNTEsNiArMzUxLDcgQEAgaW50IGt2bV9yaXNjdl9nc3RhZ2VfaW9yZW1hcChzdHJ1
Y3Qga3ZtICprdm0sIGdwYV90IGdwYSwKPiAgICAgICAgIGludCByZXQgPSAwOwo+ICAgICAgICAg
dW5zaWduZWQgbG9uZyBwZm47Cj4gICAgICAgICBwaHlzX2FkZHJfdCBhZGRyLCBlbmQ7Cj4gKyAg
ICAgICBwZ3Byb3RfdCBwcm90Owo+ICAgICAgICAgc3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hl
IHBjYWNoZSA9IHsKPiAgICAgICAgICAgICAgICAgLmdmcF9jdXN0b20gPSAoaW5fYXRvbWljKSA/
IEdGUF9BVE9NSUMgfCBfX0dGUF9BQ0NPVU5UIDogMCwKPiAgICAgICAgICAgICAgICAgLmdmcF96
ZXJvID0gX19HRlBfWkVSTywKPiBAQCAtMzU5LDggKzM2MCwxMSBAQCBpbnQga3ZtX3Jpc2N2X2dz
dGFnZV9pb3JlbWFwKHN0cnVjdCBrdm0gKmt2bSwgZ3BhX3QgZ3BhLAo+ICAgICAgICAgZW5kID0g
KGdwYSArIHNpemUgKyBQQUdFX1NJWkUgLSAxKSAmIFBBR0VfTUFTSzsKPiAgICAgICAgIHBmbiA9
IF9fcGh5c190b19wZm4oaHBhKTsKPgo+ICsgICAgICAgcHJvdCA9IHBncHJvdF9ub25jYWNoZWQo
UEFHRV9XUklURSk7Cj4gKwo+ICAgICAgICAgZm9yIChhZGRyID0gZ3BhOyBhZGRyIDwgZW5kOyBh
ZGRyICs9IFBBR0VfU0laRSkgewo+IC0gICAgICAgICAgICAgICBwdGUgPSBwZm5fcHRlKHBmbiwg
UEFHRV9LRVJORUxfSU8pOwo+ICsgICAgICAgICAgICAgICBwdGUgPSBwZm5fcHRlKHBmbiwgcHJv
dCk7Cj4gKyAgICAgICAgICAgICAgIHB0ZSA9IHB0ZV9ta2RpcnR5KHB0ZSk7Cj4KPiAgICAgICAg
ICAgICAgICAgaWYgKCF3cml0YWJsZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBwdGUgPSBw
dGVfd3Jwcm90ZWN0KHB0ZSk7Cj4gLS0KPiAyLjM5LjMgKEFwcGxlIEdpdC0xNDYpCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
