Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD90E8FDB1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B444a7cB8n9i+LRXFLLpkSLYaHjzKp9gBBY+ULSd19I=; b=MmVI7PlMQK+8F6
	WqSpE+GAe8PolPFIqh92GgC5D3b/2iwYZV+2CxVPRMDEiO5judPskkHOHNxE77bn/mWC97S9Brjl9
	F4Tt/8l7TLd9sFSgnIEbWBhqzxcY0S2W/JEY55JLd2RuK+BVYVqlqnkYxENjzlCMbCh/N81ZEwNly
	nDDgNVelWRW8kc8nxJRsOjlnONfg9euePcx4h4sfX48DWJ0UAbLOz971CMbbfIW+tnefPfR6eVvgJ
	JXjPw1ifP0+qqkLwSB7e1oJP1pOOAxlWwzF84L6HFpe7yif3lIOaEsnn7Dt0bE3b4iIEDtQz57JuN
	14iQVunXj53ZXKOOEfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va9uC-00000003WlV-1TkL;
	Mon, 29 Dec 2025 09:51:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va9uA-00000003WlC-1sZy
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 09:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767001869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBpgnCdgVjRyDFiA5DhH+bRquSZr5l4Vq9ipoB5aYAg=;
	b=U4ovNVaCnGlRGNHBFD19yephisqjREPmiqV5wNXg2Vi/VFCpT2AqHvD1h/cYR5RUCOfIav
	Du9GwbCb7UZc7MNDpLadFlo7jwdEn2GULCH4OsbELE+Zn7HEypr8w67mHM262spgaaWPMv
	1WdHDUOLgPyOJiQQ1mfE/4mKd4OIj7U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-BYz4WEakPt-oTGc3FcAWyg-1; Mon, 29 Dec 2025 04:51:07 -0500
X-MC-Unique: BYz4WEakPt-oTGc3FcAWyg-1
X-Mimecast-MFC-AGG-ID: BYz4WEakPt-oTGc3FcAWyg_1767001866
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4325aa61c6bso3082866f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 01:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767001866; x=1767606666;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBpgnCdgVjRyDFiA5DhH+bRquSZr5l4Vq9ipoB5aYAg=;
        b=ZJ0Ea+bZzC6b6qRZWFMroidFjAvzd1+zQTe9oLvhBNJWZD2l5FK04xbROqIU8Xpy++
         kFgIB+QXvc9rLPCgFhZUhOmdQD68Jy2xN235NBHL5LgtzuhqzAbFEBtKDCDfDN7fZXwk
         4yX+/0vxH+1Lj1sk3euAh1TCNTgisQiBkIMiYGmmo0nuTtGXxSbLL9nRFIwTO1XDHaX0
         FifZFVrCQkBAdRa08/R/x50hA9FwPvo48SRtAXXDCncpJyn2CecmEqWMaMjOpk/tToEb
         aRLoBzjtjhTqQOK8cOfedG6ynCSoCJz7W4KQ0ebuFPG5L6htpcUkK3CuszuTq7PjAMmc
         XCYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOVoDaSC252GTPeSwdQxmpSF5nUVv/2JQ+WObONfXERtb6D1KAyuN9zAUSfG3HRa/zKQ9Bv4GoSu7deg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr/G/0K5MIXl/+vYnB+faB7H8NCJzBdA5RPM2rtFnBzINi7UPe
	B+kG1ExQR0362tOKP6WORRrrknKOunhCO8j64M0dA7mEXfR05kdD6YugQkbqoSndutkFe3Lnv2/
	+u2xCeFLWWV6fgCCMN41HWVlH2KMLUksg9TmJFCfzYllDnnfJg6bVfMu4ihJ9/jM9nSqC/w==
X-Gm-Gg: AY/fxX4Q0ZTKA4/DxsPvUKSYdr73XNdtihgB7kHAIEdVZpE3XWMjRqOM449WcHC/CcK
	YvghhtBl2mdC3vWT1BwQNAwrIi7535yCNDVPNxTNo0CRBx3PPm78/ESVlVJRwujterQBT7uA2DQ
	iw9yhL/zGT1c5DgoatoYs/vAzxmRYp2CrOEa+l9/7o7LiCcfLE3tupvp/NtDXn9ZIW7/8vjCW56
	JkOnrA+DauRowyGmAytumTsRo62oeds3dfKReUnwSxQXv2zrC4YR6Odt3wsC98Wmxf3s4aQucj+
	u2PXIJOH1mCk7n1VsYyD//3jezoIoY5CUAN9EZCa7g+C4PaKiIaRWaLRKeSrfnNX+2I2O23Viuc
	Fnh9Q/DrO2xGC1avifutWfBgDkR5GitGIpGK0cX/4YiVA3NZo3JKxHINxNij5GysG7BQQ
X-Received: by 2002:a5d:5f87:0:b0:431:a50:6e9b with SMTP id ffacd0b85a97d-4324e4fce39mr33803707f8f.37.1767001866455;
        Mon, 29 Dec 2025 01:51:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6G1jWYskSgvaXeS09XPL1OAXa1myU5ovRIkOqfBW3h9fMcLnWjubhvT9bqt7kVVsnsSU5PA==
X-Received: by 2002:a5d:5f87:0:b0:431:a50:6e9b with SMTP id ffacd0b85a97d-4324e4fce39mr33803665f8f.37.1767001866019;
        Mon, 29 Dec 2025 01:51:06 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82fa1sm59086626f8f.23.2025.12.29.01.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 01:51:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan
 <dlan@gentoo.org>
Subject: Re: [PATCH v2 0/3] mmc: sdhci-of-k1: add reset support
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
Date: Mon, 29 Dec 2025 10:51:03 +0100
Message-ID: <878qelhb08.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NZNWS9P_6PTj8GKu-s8JV1ehWjiRXs7LtX9ADK9RqdE_1767001866
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_015110_561866_F36F315B 
X-CRM114-Status: UNSURE (   9.53  )
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

Yixun Lan <dlan@gentoo.org> writes:

> This series try to add reset support explicitly to SpacemiT SDHCI controller.
> Previous it works well for eMMC due to it's already initialized at brom or
> bootloader phase.
>   The controller has two reset lines, one connect to AXI bus which shared by
> all controllers, while another one connect to individual controller separately.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
