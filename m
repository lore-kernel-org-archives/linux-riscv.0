Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141FFE7E351
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 09:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jE3PnkPaZLetAwrrluAcPRjk+Dv05dVeaMWRSDgreSo=; b=WPYmCvYyyc7HEI
	6tH2gymdFnuKwh4lo99oB1niRM5Y0ltQ7QQRXek7kM0V1vGpsJHmOldzvJQhsbAfF91nrRyKZvV0a
	KVdOFjMv+OK3swqYSfQFnPjoYlf+6VVt4uRTDxDcY/FlCPdDMcRWT5KQqwSqr70o9Iu5KSCBIVkyX
	n2KDro1Illq6p5V7D3cZTtpWN8wkmSdYWkp3gZHShhTOZZq7snZZJ1Vd6hiabYiWd6kCwvpKThjBX
	sx+P3fufLdsVOMkxKMdifW30a/lngGuBZnhmf7Y5TPhq3TEUb6FqbJn9jG4x/Rup3fEzkrGXqgfmw
	ag+1LXgIZm0xJsKM9j3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aTJ-00000001m0s-1M6u;
	Fri, 03 Apr 2026 09:05:45 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aTG-00000001m0C-3Kz1
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 09:05:43 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7d7653db148so1060363a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 02:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775207142; cv=none;
        d=google.com; s=arc-20240605;
        b=XKYfB0p2gn17T22XL+Y0ROqK1eC3snO+BUTA217e1LjhnMFBxLgsFn9T3Zgnbil/B/
         SZYIPI6adhaUGBLPbnSMgX2fcyi5ArD+H1GN5RAzv5rRjmx+2Sblkhds4burYVRQygSg
         608lH+q4ZD0K3lRMK2/s/Y/t5VVFrBaOkKoz879cy87esRMTJ/u5YM5L2iee1sNpF8Gk
         UpRxHAxVDnDc7DtTZbdztOUKdjiB1RD3Pe5mEuI8oW9C6LFJjd325tlE13u5ixdX0UG4
         xLVIHJfVgeVUaW5cn8kObY3b53GxW2Lk75ETGh3gPmo/3ll6TUxs3em2CDHEeOVo8ORl
         3b5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CCm4AYakB9dKG7bybl0vV8lp+2k4EkmvPsl1dYhbfsg=;
        fh=Wwm00UpJ9aoI9Am2ugz2VZ8P/yRVlw3F4pqL6cZzA/Y=;
        b=gJj1I+AJmFNooOlovyxxkmr4PqNalkEKQVepsDSCOK3+/noT8zeCU5KQXYsNoIH4L/
         6KHLlrgxfOAJ1aLyEqmUOnm3z1Wx1tDlBc9Z7SGqb7S6amkEc4jnJnxJo5wkj/haDxr0
         UiB1ChynOwyB3TLGaiQmdP9HO178ygLefgRGNLTnhKzL8VYGUvDbR+1XghKDYzizzmlb
         RcWQNUl0YGQQjZMUo26E3asj7GDTiMg46gcz1O7t9MZA8dUxtbTSbTHN+qb7emcthOvh
         wogQJL90hgstW+/VwBs0q35NzN3ReM92DbqjWht7cdmPcSHSR1TaojWVR1ZKMADsxulk
         hMkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775207142; x=1775811942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCm4AYakB9dKG7bybl0vV8lp+2k4EkmvPsl1dYhbfsg=;
        b=BRXBO63TBeYneGhALqq4lGKdeLP88mqgKtMWdT+t1s+U7AlGnJXchsY4k4fZWPElJB
         l9BLBb8c4AAVoqcECe0puJ9oMiO/uSRNL95cy4BBtJI1qKUIldIeXkcBJhidMqYINHGG
         d/W3LWOPloE/stj4IDLvi1lBb5tYfg6gJrCcGY4gTpmQBr3IYYCKn3yTAhhy2e3MdylP
         +I3C+o7waPkO79olbfqb5VpQOzc3j5Y31k01MHJEKv3dvsVrIUROnzKobB1tMrRxKujF
         H7FTTn6pemzLsnnj8uy2xWk73ZYi7YKKBSxtMs5RgKUI5ibKechNBObJaJSM2Wfb25sa
         700A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207142; x=1775811942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CCm4AYakB9dKG7bybl0vV8lp+2k4EkmvPsl1dYhbfsg=;
        b=qfo1SjuGqvIadstPz0V+oIxw9bJlP259hSZFsOtzXTO98j084Tf3ZaVJKT+WNMOGXP
         Q0iC/BdZNGsPRaRnVddmR/PYD75r5Z1Pl/YFBhUsZwu8weinWjM2ky9Vy09wWWSExUXS
         qOX5U+ehQZPBiflPRz3EmFYhaNvTgeSoiRPAMSAfFfBUers7eDiMrcyeluqHpM+0CjSd
         dD6s9ie1DhF3yzhWSvhG4StR6Kd7SOKhDvYcMaveoItrAIjyh87ys4d15hMvvsTO+p2R
         O3efCUTdDRCWj6ipMN3P42Zt+6GZ3Iv7dwWlSsV+L2ACwoYBS2F5KyVGTPgODvVM9ccF
         e8Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVVpb80ZzE4X+IFHhDTEeMoEMHM2/g75CbsE3UJFMcPywDxKyVYqrG/4zJRFwJbo6Lz5g75E8GBCIVC3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz55kUATdaeDwvjz1DMCs6sd/xU397i6aU1+ftZgEzma9C8J+a3
	SxWnnE+MAk27O5Y6RD9ws7fMbsgS4mwMy4nWM1lKbNKtnh1aDTg6bfUgXEHljIQlxUkEDeYNMgk
	3jUAEWU16Cce9wd3xc50g3dX6Ial9KKmSZyzmGzaoVQ==
X-Gm-Gg: ATEYQzy7F6vZyBRfEIYx9LiAUP/fONgrnjF+BZ8SFxHlklYTTBVkHgPcerTWvgQ3Y6S
	8qIN0Za+ePQo+f10dZIwtRtZRdTMM/sjHM6HswCPtJ4G8Uqvpy0EhYAiWQU5/dgLYumJt8ZmNZw
	kpt0X6UTSq9vEc+WBpRzSLXibnOHH9YK5M1ZBnDiVs+pQvn/FPb/B+3hgL5iXm42H1BLaNQc6E0
	+L5wxlDTW8X6a4LPVKhg1eu+RpBmUVniZJYeJkfkTo8f1cbY2NIWEUwZMfA/MPwlQPpYL6vKpsl
	ayfVLxuED4jxDzuY4Bye58ebHquNLdl4nPgWthficy8yc/h9dXN21bqpaCBFKdskbtHpOz5YL67
	RQ9htr7zCJJTQ3Lsy7o2vxVvZ/g==
X-Received: by 2002:a05:6820:81d4:b0:67e:cf9:ea19 with SMTP id
 006d021491bc7-68221fffcb0mr1063073eaf.59.1775207141789; Fri, 03 Apr 2026
 02:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
In-Reply-To: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 14:35:29 +0530
X-Gm-Features: AQROBzB9KrI_BrZ8TmyJzBaJ6ObiJnp2kmnWownjmY2mr4UtyY1LfTWXeuUiIwY
Message-ID: <CAAhSdy3dqmamQX6dtxhXasFmYhS=j3YheSLnBv_sh7A3FZJLVw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_020542_858716_FD4E4460 
X-CRM114-Status: GOOD (  12.93  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAzOjUz4oCvUE0gTWF5dXJlc2ggQ2hpdGFsZQo8bWF5dXJl
c2guY2hpdGFsZUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IGt2bV9hcmNoX2hhc19kZWZh
dWx0X2lycWNoaXAgaXMgcmVxdWlyZWQgZm9yIGlycWZkX3Rlc3QgYW5kIHJldHVybnMKPiB0cnVl
IGlmIGFuIGluLWtlcm5lbCBpbnRlcnJ1cHQgY29udHJvbGxlciBpcyBzdXBwb3J0ZWQuCj4KPiBG
aXhlczogYTEzMzA1MjY2NmJlZCAoIktWTTogc2VsZnRlc3RzOiBGaXggaXJxZmRfdGVzdCBmb3Ig
bm9uLXg4NiBhcmNoaXRlY3R1cmVzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYXl1cmVzaCBDaGl0YWxl
IDxtYXl1cmVzaC5jaGl0YWxlQG9zcy5xdWFsY29tbS5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBm
b3IgTGludXgtNy4xCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IGluZGV4IDUxZGQ0NTVmZjUyYy4uMDY3YzZiMmMxNWIw
IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJv
Y2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3By
b2Nlc3Nvci5jCj4gQEAgLTU2NiwzICs1NjYsOCBAQCB1bnNpZ25lZCBsb25nIHJpc2N2NjRfZ2V0
X3NhdHBfbW9kZSh2b2lkKQo+Cj4gICAgICAgICByZXR1cm4gdmFsOwo+ICB9Cj4gKwo+ICtib29s
IGt2bV9hcmNoX2hhc19kZWZhdWx0X2lycWNoaXAodm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJu
IGt2bV9jaGVja19jYXAoS1ZNX0NBUF9JUlFDSElQKTsKPiArfQo+IC0tCj4gMi40My4wCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
