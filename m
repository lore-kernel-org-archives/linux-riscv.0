Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA1AEE3F2E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INaDHVtWkNCJWyjNsP1SQ0VSLojoEiUgIKSVJ3zkHuQ=; b=ZLiNx9rVAMbSDn
	6OJ07ksLh4MzklGSf/C2q6d7lrxAliGzbsF4yhutuMeUsN3+ZcEYEuixJVEhmgpcEddveOS7BGiR+
	AtUuqshmktg3W+OLiuZ4B9hyTIOJpw/ma0yxAILs9n/ZEre4inTaNN3gT+XXj3CXaLhzkSNVDPRzg
	Wb7fco5SXj2xSyMNozm8Hb/e4MKX4uCK/8i9DWWytl0GIdfEumESzxSP8nIfNM20wnDDR4KyIwOZu
	As6SB8YaFvKScyV+KvL9lZ3FudOl4JS1JId0jjeh9zVHSqY0HGPDbHVXSTKXlHFf3uVTRs/XzwZiX
	LYJlYW1Jmhe6B7txb6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2F8-009twB-2L;
	Fri, 15 Sep 2023 06:23:54 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2F6-009tux-2J;
	Fri, 15 Sep 2023 06:23:53 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-500bbe3ef0eso2141636e87.1;
        Thu, 14 Sep 2023 23:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694759029; x=1695363829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1zuvJ7RRCqy9MSyULz3DiU3qO3y4/pQtJW6GP4mEKM=;
        b=T1YPWvqdGYyMk42QfDlBgrTCw2M6ZtbzBoo9IFgR6oEW9scFx6XQbeV+vktvy3VwTP
         lgfevLQiXzeo1//AP5YWyc5huI6qQ/TV2JDtHQBuo52MFM1rlvovXPqrvIA/Ech31d7/
         bi9TVXJN0CLeXohpJ8Oht9Ps7lbvQ+iHWTVrtQtMyos/Rshcy9KQFWG2VL8yOqUclIHp
         ipVE47QSZgm/1ItiNPp7797bdLMIp+SFQaQG6gc2cB9BnkSDO/3KCnaUQ/BpIx942fyl
         KNkQjCOrjpm28udFy9FRIoq/JzkDQRTCME4iJ3HPQRxHgOCwaKRA77W5uav8Ccgu0IKe
         vP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694759029; x=1695363829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1zuvJ7RRCqy9MSyULz3DiU3qO3y4/pQtJW6GP4mEKM=;
        b=WJIphs3IJDK9uDaRIomAadpScaxQh0wcudr2tumAEJ6RAfWyebyw4tWWqBR2sO8560
         rDXO08Il183A+6MiJF6UdA1CbtLJYJrz3i1tWiZJTC8+wsky0CD9HGgZp1fEG+k/yqMh
         yr0T6Y5RHgsKWFE9pDo4ZyrEtUNW7s1AvYKd/BzzYvYiAFCcO47v+0QCpkNdMbLkzntR
         FRPoYnq15zlFRLEBQc0gUIjYRtgBChlQSK20NiEJaabPpGsbbQO+izUPWlhqbJnsxiVr
         wDINnT+h6bov/MVFtryuMLroopO9McJYCtoToIJWd6e8ux3QMckQgUcdN7OcbKNHYP94
         hmig==
X-Gm-Message-State: AOJu0YwUx9WlXfKBnG0KnEs3C5NK7LhhogXRgV14LQB9kvvtT8A3Ox7+
	wVLebOGWPavAZ7iNaCl44XhETDQPU/9jOG0b5bc=
X-Google-Smtp-Source: AGHT+IGj/HsfBsymLbWepYETxK1fPN+QHY/uRqAGLNuLGZZu2qI+OypS0+lHToloM5nAwXB8QRxambJWef0/qHqiQfY=
X-Received: by 2002:a05:6512:1095:b0:502:d973:3206 with SMTP id
 j21-20020a056512109500b00502d9733206mr1476766lfg.6.1694759028702; Thu, 14 Sep
 2023 23:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694421911.git.haibo1.xu@intel.com> <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-ee133dd5e804282ce28833d6@orel> <20230914-reflector-preshow-786425ad7ae2@wendy>
 <20230914-2232dea1c6d03fb5985755e6@orel>
In-Reply-To: <20230914-2232dea1c6d03fb5985755e6@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 15 Sep 2023 14:23:37 +0800
Message-ID: <CAJve8ok9de0bGMU24iyUSX6V4+1tZM3ca=Ntyk=2gythd4uWCg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Sean Christopherson <seanjc@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_232352_757482_C448AC16 
X-CRM114-Status: GOOD (  14.81  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgNjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTA6NTI6
MTVBTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gVGh1LCBTZXAgMTQsIDIwMjMg
YXQgMTE6MzY6MDFBTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gPiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgY3B1X3JlbGF4KHZvaWQpCj4gPiA+ID4gK3sKPiA+ID4gPiArI2lmZGVmIF9f
cmlzY3ZfemloaW50cGF1c2UKPiA+ID4gPiArIGFzbSB2b2xhdGlsZSgicGF1c2UiIDo6OiAibWVt
b3J5Iik7Cj4gPiA+ID4gKyNlbHNlCj4gPiA+ID4gKyAvKiBFbmNvZGluZyBvZiB0aGUgcGF1c2Ug
aW5zdHJ1Y3Rpb24gKi8KPiA+ID4gPiArIGFzbSB2b2xhdGlsZSgiLjRieXRlIDB4MTAwMDAwRiIg
Ojo6ICJtZW1vcnkiKTsKPiA+ID4gPiArI2VuZGlmCj4gPiA+ID4gK30KPiA+ID4KPiA+ID4gY3B1
X3JlbGF4KCkgc2hvdWxkIGdvIHRvIGluY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiA+Cj4gPiBD
YW4gdGhlIG9uZSBmcm9tIGFzbS92ZHNvL3Byb2Nlc3Nvci5oIGJlIHJldXNlZCwgb3IgYXJlIHRo
ZXJlIHNwZWNpYWwKPiA+IGNvbnNpZGVyYXRpb25zIHByZXZlbnRpbmcgdGhhdD8KPgo+IFdlJ2Qg
bmVlZCB0byBjb3B5IGl0IGludG8gdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbSwgYnV0IGl0
IGNvdWxkIGJlCj4gZG9uZS4gSG1tLCBub3cgdGhhdCBJIGxvb2sgYXQgaXQsIEkgc2VlIHdlJ3Jl
IG1pc3NpbmcgdGhlIGJhcnJpZXIoKSBjYWxsCj4gaW4gdGhpcyBrdm0gc2VsZnRlc3RzIHZlcnNp
b24uCj4KCldpbGwgcmV1c2UgdGhlIG9uZSBmcm9tIGFzbS92ZHNvL3Byb2Nlc3Nvci5oIGFuZCBj
b3B5IGl0IHRvCnRvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20uCgo+IFRoYW5rcywKPiBkcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
