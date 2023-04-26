Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7930CC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAFXsKyDddaY+ujfH6qre0Gop5RsK9gnakZ2hAOM6Xo=; b=PCLYMfNxyMiApQ
	DwKg+y9j0WeJ+yx4sBQwAGHMOCu/vHohP77A0PwHPVIfb+Gk5gEXREYPTbcbKBXad1ZuD2JNjCUv1
	nQdIiKDLncy3wfjRgtR01Aw1Jqq4yn1Gp7Uqj/Mk8gR9Dn/cgmdu/Dc2kfoYivoh+Fx+QzIWRedv2
	CUr8jJ5+0CeSOMA2JBaTFVHZxTLtfby+fx4g/pVGf9evK9Npgsxl6HFpeLi/ZkitAP4QByLvc4IQ2
	YDxLxPsgphSJgYfikoU2cwPsr9vq23s0PsEnK0j14lR/JaCgDi1r8VUujj23K00ci15X7Dc0snbQf
	uDsMHCyO1jY8h1pKlC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1priHK-004Qzl-2E;
	Wed, 26 Apr 2023 16:46:02 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1priHG-004Qy9-1o
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 16:45:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-63b73203e0aso44544658b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682527555; x=1685119555;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8WCg0DbavHUTGQfNC9CNLNlK2UqZh6KuQcIt3KI09Y=;
        b=Id3EjrDuiGcspQmAnx0ZsadBd3GD8VTYQTBeFohznHkk5BH8eJICeAAgiGPb0DyAbs
         IUr4RMLj/l+kKlyu1dXy4qWUa8LRJMU73yiJDG4U9LUSBpDpe/gkcV8OaKHvxtucbqxY
         Sp/rKlu0I+3moSvzvtReSeWSxQqzmDRadnrc55zQ15f6mjcv+xER/uK+SFgykFJSKxp6
         CdElDSvfpH71JEpBFVUxXmZ9ILWdSqsVCgOr7EG8HhVWfIpDRetTS8HgwbyILVCgYbn2
         cPgObrsLr+OCwKVMPeLo1TdDIWJQZr135jE57e+fg7Xjvc9yfL8FdJgQgu+7dR6Lhm5Z
         JIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682527555; x=1685119555;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8WCg0DbavHUTGQfNC9CNLNlK2UqZh6KuQcIt3KI09Y=;
        b=PCbVPNlkRcTz5qzqwcV7RHVJTuA/vema86zAqDIKgJAT/4mhl8s0YttBg0McKyyLjG
         9UixKotyEuxLVe254r0KW7D6d7AKP+MUhyjglMH/accs160q3Kr0gleFdgOZXp5v3mUM
         +V0PP1PqpTeAVswNrbWCK+5p5M1eDfu58doxbTI1/+TfHjK1OEiQ53266BMoZ8Mh1HHC
         XJp3ohEQxUa48SFyYQPk1hw2EHfoN8jAE5qrejKhO6EjH6y5Ut7cXtrZ231RVqBV1Fgx
         xU8NGGhdjXnmOvYtNP2AHmKaOdIbVTLQOh4SSSbDtl3PU0StZ35s5PYGp87ArMc32DQe
         8j+w==
X-Gm-Message-State: AC+VfDypMTd26zhMTKtz8/0b0Wiav+RN2pCStSLXTKNeaaItwafNg1C4
	9s33ginfm5BAr2TNa1pcBgnQyg==
X-Google-Smtp-Source: ACHHUZ6tGIsEUFAb6yVJqOuxcDgkivNXP8hXw84xfPO5NUKHaPCY17+lkpeq8w4Bl4N5UKb32MZJxw==
X-Received: by 2002:a05:6a20:7350:b0:ef:4fa7:b1ee with SMTP id v16-20020a056a20735000b000ef4fa7b1eemr3687055pzc.4.1682527555253;
        Wed, 26 Apr 2023 09:45:55 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id x9-20020a63f709000000b0050f56964426sm10036648pgh.54.2023.04.26.09.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 09:45:54 -0700 (PDT)
In-Reply-To: <20230424-rival-habitual-478567c516f0@spud>
References: <20230424-rival-habitual-478567c516f0@spud>
Subject: Re: [PATCH RESEND] dt-bindings: riscv: add sv57 mmu-type
Message-Id: <168252462347.26895.2637779142732183500.b4-ty@rivosinc.com>
Date: Wed, 26 Apr 2023 08:57:03 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_094558_597710_1BF9B9DD 
X-CRM114-Status: UNSURE (   7.15  )
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


On Mon, 24 Apr 2023 18:05:43 +0100, Conor Dooley wrote:
> Dumping the dtb from new versions of QEMU warns that sv57 is an
> undocumented mmu-type. The kernel has supported sv57 for about a year,
> so bring it into the fold.
> 
> 

Applied, thanks!

[1/1] dt-bindings: riscv: add sv57 mmu-type
      https://git.kernel.org/palmer/c/d4dda690b44a

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
