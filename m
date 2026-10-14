Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480F7CC6B2A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 22:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ayUVHy+5HQOye2w28awuzilVFL+QGGo91oOWJIoq1b8=; b=3fEEX4lNpqmXAM
	zNrfgL5RtbvLtr/XrD8nttQNWfvVIWDhzPOg4x5V/6wElMN8ttBkrL0w8bkU/iAwg/X+h/ev07Yoq
	SyQJTBWBNvii7GDmTAaMkeCZ9K7thSHcVNLfnqWK6fpk75qHxFY1/2w1qkOAskUqS8+E4VRdJRtLr
	GRVAV5Da+41Vpw+9/7G0ejk4/wicMYaGTFtNaiWrreamkWRThbIbLHPyX97Cwkk8PmBkk+JnO9eTr
	vW/cLMRi9NurB+/MEi8x5sag5iiwWA+RkY23dCqXo5yjrdLSb6n6GsWfigwEIZqG2zkh9l2SbCCcl
	ROdVQsF4PGdmHfkP19+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7gZ-0000000GQ2b-3kSn;
	Wed, 14 Oct 2026 22:42:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7gW-0000000GQ0n-3vpR
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 22:42:59 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 320EE3F920
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 22:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017773;
	bh=WBIhOlBUrb5LSRkLKCzEi1n3OV1RnmBzhcsSOFSLY10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=niqo6s7JV3DzifgjIMIUc6721jR22ik9S7gOFQzGVKeohuQQDCx+v3qimP0V59JCa
	 7wfIUwxDPfCPBVZ6XpR7GRs8Cn1vl11lQSeGLIdyO7P4uHaxKlvlpeoG/EPko6tjnX
	 cCVXJf8Zic5ctK55l1aYFieBvyiDuUhWzMr/HUbgtiw732IYssCLhgX6MDdLRB+U1D
	 sOqQV2ztmw/7ygsFpaZWkqyeKIxMFkFQow9Hdbrlxt7oCyXMRGA8A8XqDRCciDSa2k
	 mbmegdFk0lMDUXm9wypk3SGNrTfaq0S2GfFmlB5mEKB/Iuh2/F7FDXr2g0RGj422hJ
	 57yGssrnUIRz0nmH+hxeEg6rtMP37OHO7JdL1NPLQXiJGJTnnOWhG808GOUK8ECEYy
	 /V6dRSwKZZMJUv9UCprnOfwApg4LeZ/nO1PgG09RvDfNi9cW8e6rrr5D8D8F88iSpd
	 jz9ZMKOZZLpMzp4osSUqwr2WXSvML1UO4visd6xCcSKLRavafOD3D6CIrySSS8fwl5
	 Bgf3hoiE863T9qrECnOqEyyDbtIHRXNioVNheLYFx5BAVm4KvlzGFAr8q3311JgGDX
	 cDVHFT0w3cVFRfShRTZB3vHl5cv98Uqo5E9hD0anHbbUE8+t17ersJEFcEN5cQ+moH
	 LROZymBPE40opYBHRldgE4OA=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso37201875e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017772; x=1792622572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBIhOlBUrb5LSRkLKCzEi1n3OV1RnmBzhcsSOFSLY10=;
        b=URaJZjdMVMqMmTfq/PMeR+j29UXj8v4pkp1FBujOraEpgE4zWjISjeLHmy9aaQeiHg
         xn7b9WopMgScGhBKerz8ixnbXny+6xvFTK7QjkQBz7XWRzlU+NbfR1Z4kXS1bkM2QzAS
         fFevP+oYqAWNJ1AzD0YwVbwkVhz1JAtuKIK/4WkcMsK6MT46aPzjqHCxGnfp+whLfmN0
         c9iJozEQji7DX2eJFqYUI3yYuRdvlGQ27plh7U/Nbk+xZYUTHVFDopbmu0WNUNR1hezS
         4wnlL3vD4U6InSDperztJ1buOZBCx/dBGDU9URmpaLi2JcJxcsDIeGl73sbJZbfntSQh
         KR/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLzewmLmQYsMpD1hQu2L/LySCrySunooaKxrIb8DqTY+1bZpeMcdqCiTCS/RebQoArDA9SF8zsc4/xcA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLrq7u9KVj1QOhGB+v5mgjn1RgxXroOx4raGk/+zjJEpI2iawex
	ii+ePIhg+AH21MyiFn0mCHMrMD2O8CPHvuassZVYV60yYXkkIkPDiAJQODTwtLbcz7PdtasqkGn
	ChxzXOn5kJYZl5iT3c99aVaamznqa0IDSvSItOFdX7Wp3BJObjTlfKMfF8vUi8Mw3JGiwl0HskD
	GMoH15r5dhqA==
X-Gm-Gg: AYBFou2AgQDRVOOkD+300yDh5JQGG4Baoeddsr63DVMKRMJ/r+6xzhagt/1cjvSW3sj
	YfgdU4M7QX+UEj1uo0bJTjEIgz/dXv4qyEcrNvvL4ZVZkUlAg5y0W2e+AYafqt2UyebPMyK/UZj
	5EN1Yc/N8Wa0VX6XH4vVtULvbCZy0hmoWW78KXTtYoAPlW2CGenReEF1owNt8d0LBaUqM9SepSO
	hsesQgoG7SttFQ+Xkto/VkmhZbuvxw58wsCTk6X5i2MkR7rtPlr/ZG29xHPQ2CIkhU5E6mtwI1L
	sXgjn/EYxb+BkmXqUWyykr8hJiqNV/cS2yBoSj6OzeIleZS+PPwfLA1w1FHF+s0vSFzRhYMBdBD
	WVZj6uzhXmWkMbkkCZPX6qDs74oQX5LT/giqyU5drhK2JXS2Xw7mqUXB1
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr194079875e9.6.1792017771977;
        Wed, 14 Oct 2026 15:42:51 -0700 (PDT)
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr194079785e9.6.1792017771721;
        Wed, 14 Oct 2026 15:42:51 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:51 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sarah Emery <sarah.emery@canonical.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 0/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
Date: Thu, 15 Oct 2026 00:42:37 +0200
Message-ID: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_154257_388107_F51D2343 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Extend the KVM ISA extension array to allow KVM userspace to
detect Zicclsm, Ziccamoa, Ziccif, Za64rs.

This is just notifying of hardware provided capabilities.
No KVM specific support is needed.

Add the extensions to the get-reg-list test.

Heinrich Schuchardt (2):
  RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
  KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs

 arch/riscv/include/uapi/asm/kvm.h                |  4 ++++
 arch/riscv/kvm/isa.c                             |  8 ++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
