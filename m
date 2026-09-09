Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD3BC79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1mwIs/w8bx3V2PvRLRM01TW1m4IOMa81QUe8l2fsH0=; b=PBJYZ8wcMBEf0m
	1RecJW3nWMF+EDTAYS7igZ7kke83KFlqlVZ0drDbJdumurYw61++tLDRpiblwY9QH3VuVrJBPTobu
	q9BgQT7i/V6ncKJpgHktt2l24J5ASSbswROVw2xNCkAsWgi1axDCYGvS26SJAg/L+GIvojWKRR9e3
	3dMWm0KdMnxPds4A+vqDG8LW2R2vkBraC1haKOGPka4+cuWEmw9IAq4aKbkHcoL9X0eSEZVjaiGWR
	nfGipI/ZlgvZ92Knjc98ZvDRgUzgsJujIsKgLgKEYMFPskRzN6vMncFkoyZEsXP5oNWb8WnOq/pdi
	tfqSY9VhUccKA1oJF9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Noa-0000000CgqF-3wgh;
	Wed, 09 Sep 2026 19:18:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4NoX-0000000CgpT-41iP
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 19:18:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so42035355e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 12:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981512; x=1789586312; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cQp1h+Nea1dCnGwxCQ5G9ZglVlG59gCPu/u14By/urM=;
        b=FrTMLBDy58cMhDAK87FCi/9uVBa7hKvkqB789yMtIuGV9SrD/ygXo2OFPIrGKsExXa
         QXZ6r5EpBcdW/reE2BaqzadWyZblsEkhpeo9VrY17y6ScrXutJZ3njeyyuSAlmbxBUMn
         zHdRoLE3UXIVfiQ5fgs9qHucqCEPYXHNcvKOZ6BYbq8sqtWvLIuBXggx6um9s1t5I9xQ
         TNode+G6QWfQrgXOSa20bkySbNK1V73BrBW/KOIqiHeLpicd46HraQc5r8vpWoBb385g
         dhHT3dXqpNPNUBuYcMvl9Gi6Sr4ylWiJsWYcK70JAqeKufEgkBrlXiB4WDFWJ0W480WD
         TLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981512; x=1789586312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQp1h+Nea1dCnGwxCQ5G9ZglVlG59gCPu/u14By/urM=;
        b=S6xKtjQ1pTwHlNL531GojRtMjRJ8HMyI04l/f3H8OZjRMD2iTMkR1Osod3+9RUdLOg
         jwN1vChVXNkg9P8NLcTJ/zgDpOOIeMb+cFjXvBrdOYC9JC0YdZheyesN6Gm2EvQBjzwk
         u7WPhT3RFDB18af4sFmrdtEVGrF8HRT2V+UVRUce3IRSmdlsYDe5z4z18Equ9UtROipt
         ur1oRhXIPdgdO/9IfGOWiepIUHQeSfyJWNAFxvPjCOpDI0jigv2s5dqiF4YR82NHp7wb
         YlhAphn7yggqL0NoTqGBUmJY0VQV2Oo4qtM2+8SsvV/35v86Aj/jzHHvHgYcDX4+mDL1
         kFKw==
X-Forwarded-Encrypted: i=1; AKwUvBxmkfhuCOKGtZps63e+WG+Kwoc76AEess9AgF/Su8PWq5L8sDVJAkjNtdgqHOkHVkoFh84bzPflQDHQFw==@lists.infradead.org
X-Gm-Message-State: AFuF++mHfbr3uWJExmDQlUATVz1JG65+rZwOhxarTz381FhlHZlYdewz
	CK8gLIt1Wplq89YtRImC3VXJvVdTjMFzFyhWYApNRyjhOftTtII4rQbW
X-Gm-Gg: AYBFou1A0rtQbSXC2UP3rCpzkzUVGEDF+zPsfu0vNCetbJRJeeTonuoa+O1RBUXQFXE
	AgNpGMX3zYuIW42bIWI02uTEJC0f9KE6tEqCtzC5rF6qAGooHcReU+G+lpbKF49GvA0AStdekgW
	cJr3BIRgn2BiyLPt2OjBOHR/R8mfQD5IQ3tx0oh2ZgVAJXldQ8pCMAeUvwzt1+b7amls7W7mALH
	Jfi85RaFF/8+JHoxn/QUuSXpE2teTPS4/2PQpyzTCo5KgPaziPgNDDBDGkp8B/ciA8brN8nrmZK
	yecawqdjZW8WID5IQ0EYxY+hMEdWAOs267JlnjbK+nSmcrzdsfImHEFLEZDbAXsSFx0iHsKE4B+
	YnmelSf6m3GM60SjFpaA8z21/IOIaZESyX/srqqk6QVIuiQi35zn7xUAGNXzA8NC3EWI2AmtK78
	1pd6FqYoph4e5gzRplYhsZy8Gcoi761ikQ8UenFDxpA+Sr4m37eLteNvubylV3IbovNhOLB1WRp
	knOlK8WYjaOdTxT+DLR4Bg0O3EFO5c6byyhUWpqU/I=
X-Received: by 2002:a05:600c:628c:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49d17a8745bmr144560705e9.12.1788981511672;
        Wed, 09 Sep 2026 12:18:31 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm164538455e9.4.2026.09.09.12.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:18:29 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed,  9 Sep 2026 21:18:16 +0200
Message-ID: <178898149654.33757.7826789084252321894@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909113625.000063be@oss.qualcomm.com>
References: <20260909113625.000063be@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_121834_005943_3D4A08C2 
X-CRM114-Status: GOOD (  11.42  )
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

Good point - that reads much better than reusing scale as scratch.  Taken
for v2:

	scale = arch_scale_freq_capacity(cpu);
	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;

Same semantics, and it makes it obvious that both the multiply and the
shift stay in 64 bits and only the final value is narrowed - which is the
whole point of the fix.

Agreed on leaving arch_scale_freq_capacity() out of the expression too.
This file is arm64 only, so unsigned long is 64 bits and it would be safe
here, but it stops being self-evident to the reader and the cast that
would make it evident is worse than keeping the temporary.

Thanks for the review.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
