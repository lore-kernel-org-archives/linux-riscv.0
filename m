Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4085CA5FCB
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0emREzupGppE1mHnJFArz4pHyU3To7tnrBsNWIOCLxE=; b=FWVpSQv1STDpa8
	j+VbeVLTSieXxnRbBmgFIoODt6IJbZXxoT3kIR6v5vlyuw5M7rbRU6kbSiAYARvWo/jbNek3j249M
	AlINCC0GTYGuQWE8GaTMqfcBLhbbGEVkqUf84XM7aSflOiXLvtR+Lm6UR13Y+5pheObTK5z0J2bDP
	y8Txc52Y0fBamZUNxgZ3+9JaZLS8cFegrFfiZJxi1nLOSa+aP+V0IVNBNZ7F5FcXlVy9q2gZZefKN
	NlTzR2X/yvG4Z8YgKC0DnpPGI8EsxYrhbXQXizo8DmE0EmnmJPYVLOea1LgNL86Xg8OJc1REDCjKE
	5duEG6bLKZ2aQoxXgPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIUn-00000009URL-2sqP;
	Thu, 01 Oct 2026 15:14:53 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIUl-00000009UQz-1tol
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 15:14:52 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48aff58e6abso1180636f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867689; x=1791472489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
        b=D7SOfW/UN3CPMPrGp6y88lIoNTEqke/3KgBIxCLdQSlkkMqjtQcSbp0RE5D3eyxADJ
         BIX83fsLjl5UzthipScA/+rsX/27l2Zv0x4aFPJNnxiq99VoxIWUx8sH/cZdBBKzGtP8
         WHaC6XHnwSw029aWfNSRTkSaz7Db+iSoTjvHSNGT4ZLbeqmh50kIT7TgoBNtHnAsrI5Y
         fl++DzJLw73AM8NKydgsKMM74HPeTv0c2JqqRhlpSC2mqCjzaCNDJGIQMWBm4tvyE//i
         sgH3eQk6tM+1ygu7w26bK5bWgzi67o2FwXiQNGtalHAI4c7IOl/w12uKbR7wyrR1o8AG
         xRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867689; x=1791472489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
        b=tsn+V7yEtpcZBYwbWf8tm6J67IYsFgqs60FRVp9m6Zg72X+Qwk7DCSYYSJSfJCrVs+
         FU1qi8MInvUimevHwwJWbfNvXNkjlpjNsV5gDyiSsXIJmhXf/pB0cGIlG67inpwOD46d
         gA1Q+oSIRW7Ts2bDUjXt1aX4nfReV7H/V4AgGf/USrkLreXFFoqqLsykXrokDoMLrFgm
         1p62n4RacTkwLnK85XWrh/6a2G3ocgW24/JFuey2G6j/pB42yqQ5HRSY46CaeVFcb4A5
         F2w6IY1btyMUqGsTyFpiGqFeA3Shz+pEtKBwcvTqRXJ3HB/GdzbRXR/VbqsbxaJcceyB
         kskA==
X-Forwarded-Encrypted: i=1; AKwUvBwLU2WYaqSiFLRomufZhGrN8IjZupFPK418b/YMkaKlZASbRQCGOZ/1ryzC7hV32pGW8RY+dm2L/PFNYg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLEWoxPxArqBXTZS1G3jGsI5FbKraOaaZDLBTb1CIFnv5GTRUR7
	LgO/RV2q4WtyEUOA6fsvOQaT1UhIqpYdoCIkiMx9dfUEM13E1SjQW8zS3QiJf9MxAJY=
X-Gm-Gg: AYBFou0MvWHDWAhh15FNwLns0m+3kuocFsueuqgXFUqg70Z8Y0DXZnpic1PmtH4X0+8
	n4IExd3CA2cimdYn8z+NRRbVhejqdW2QNNreARo6CSfzoEVjACQeXgnkSryL72Qx4M7/0RtS39/
	MmIIP64ptx+dbXXVYpbCA3yXqoFu2cvGRZUaB2k8iF4nIpIFuElStYW0O0cFZ3GVUia0TMVzY2W
	M9u+6N1vi69hT8AfHh5zPurrIR24KmjhbLYtDNZybEDfPpDHsofWrIgNZro3B4x9sgcxQDP9iJo
	9mtCnLVb0x7ewdgE74zvl5nGKC+OkJIGhm9X1HZc9t76K2parXx9clzgZFJVdN1xa2Fibhej7ve
	1bSC5FEaTAF5DaiwUcsCwXdzPsBX/6tDD2PCqvi6KyrOXbSUd0qqQlPLIbt7T1pQVsBTks1MLNC
	TmmVglLrSzmOzS7R0KLPAkrtyEYFWSPl8L5LKisOJP3pxjoMz13zoGRJDZO1elh8M+fblxH3X6M
	CQGpoxeu1Nj/XpeSk6TtWcabMfUftcMfZlI0/NdGVhG3O/GvwWMOm7iYgI38jBx+gK9c8CfFH87
	o0DwdVAwFXmVZXDIxjBEBJrDq58=
X-Received: by 2002:a05:6000:1ac7:b0:488:823d:5060 with SMTP id ffacd0b85a97d-48b02544bf6mr9213320f8f.48.1790867688738;
        Thu, 01 Oct 2026 08:14:48 -0700 (PDT)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de0dsm3293500f8f.43.2026.10.01.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:14:48 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: hfranco@baylibre.com
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet 
Date: Thu,  1 Oct 2026 17:14:47 +0200
Message-ID: <20261001151447.12076-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_081451_497577_DB139F10 
X-CRM114-Status: UNSURE (   5.33  )
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

Hi Hiago,

Please take a look at the patch [1] and the discussion.

Thank you!

1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/

Best regards,
Andrei Lalaev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
