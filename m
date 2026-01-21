Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8998AD262B2
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 07:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+CtBd3ShIJBZLRNFG2dLCjuuxVrxOZ939lsmXitbgI=; b=49IUfILsdYYM4g
	67AMH7DTLhql4JZoYy+qlIK4mSaZHyYZY1eqqcKI0D06Tc5txAspNhZ3bvC5+7Icj6VpEx9DgcdC8
	YtmJJfcSB1tH2hBsMyekm+ZBpSH7+Bl1AkvVcvseUkq1JqKX4BcGRosNnjI/La/ta1dJjomUZGsCX
	h9BQn7m0kxLG9A3eIFfpgWWzUG8yEpJNHxOWyPqAuyHWnOwZn/S3mbuBx+G/FMQnU+ADT+06gALW8
	JArBdWcgUhLS9fnaX3SJnid5YPio6brf/4/gcutboSs01WcslJCPdJfZKpGQUdzz0wkU5uPK/mj75
	gWDFFkvKfFiqzBZkgk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSaO-000000050kv-1IDP;
	Wed, 21 Jan 2026 07:25:04 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSaL-000000050kI-0NGr
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 07:25:02 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2b6f85470b6so3689324eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 23:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768980299; x=1769585099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd7TVVWwSVOrQ+WPeeZgk4vcwRxKlZMNBlvPshOCml4=;
        b=ejrAEl4TLHnTHYSX4+RgR4xvu/2ov5CsfGpXnaMO5qBet4ThveUVYNieLYXqhDu93C
         8v/vwgBbpHDpbw0WuzcgOkT0mYZnO7zBEkBsaG1daHrNDOaOB2pn3HHTPIJidpwhc6bN
         gIjBHGug3fpFxM4+nKi8mqg4Q6wg+NJY51xaGHKLAhoVswJQOz3GM+zmJCNIRPkIYNvN
         xzUY8sVT5kTZ6hbD7WnuyKhVCsWsMTar2lX43YVrAO1NjDxKginMyf7S8IaCzWThcbr8
         YgLbozmzyOXwkKWOJ9RZdUnX9l+r8eCwS3mEAah9aKHbxR0ggHKvIxwRz8m6stshzmuA
         HBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768980299; x=1769585099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xd7TVVWwSVOrQ+WPeeZgk4vcwRxKlZMNBlvPshOCml4=;
        b=huo+lC2FyO9h8w4zL6eZrI973j5sdvoSqVzW6Etgj0kTK81sWRQzI3pMD+mr0dZg3Y
         Vo0eUMIxom4l/3lIZ44P1FePF1OVL3ng5ZUetT2l65aQXkfZCyIL7GCYdvgUAN0KGr1x
         wrpbK0zaqxhq3d17SbwDzKysgum9tjdrM4hiXsYaY5mEmNo8T0KfGyTgoSxuYNEtVo8z
         IB75mgOG+9z2RP2esORy7cIcvxpCrlNr4UFsVLw8dcdOI8NITogdX/K2FwpBoiMrTQYr
         AwxlwcR+hDsmQLFpupkSwPoOTBGo9AvkebgVFmL+6ld/s2etH98wpfR0rLyGyuVbJcLs
         DWLg==
X-Forwarded-Encrypted: i=1; AJvYcCVEIjBa4xo0WjgWETtYA5MPK2sIkXFkDd0ai7n9xjLdK/iYTbFY4sZnxRbk+G4f+kroZzRZTPkGjY4jvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmOCAffzUf4rQPbRTDJa5vvwFDjdqOYta+YPLjEYlk29szFyNk
	2VTUrf8oemE6hNPQuPjbGTu8+0upOUonNDvMYGExKcJxOBkX/v8tGvkw
X-Gm-Gg: AZuq6aJkmn49Zr6TjDSRMMT4ekpe5kpZqpCriLKTe9ncrBp6/Eh9y0Y3o4AevKhf159
	eFBM5AMG6MWgx+l59xTJkEO6WY6oJ0yEszrGjRX9M58awMedJjPjuK+zYhINZOtimDKIWDpF+cv
	X3A/wTsqnk/pwm13q7fv0B46le53JHt0N86AQzCUfhoK1/YC4gFj709KUSt6lbnrdKumGdwyJTD
	hPmmAIlErmwCCAmE+mFgq51bS/mRnEZ5O7pvMbUWKYpYSjUtpNm4WFmJSuGgL7WrY7VeFXzNLNl
	2oTZeHwlniUW9kPwYJDr03h5xCw2a/4i6+NYSDRoFe1Xs6cemHfO8ylW+ghGNvsLVP/yhwF1Ei9
	4Sln90zq2RA6BPAFBONz13LHIbVmHADPPl2ycAfMvHfASexQbX/kPizkKE1iLNeg=
X-Received: by 2002:a05:7301:658a:b0:2b6:affb:e02d with SMTP id 5a478bee46e88-2b6fdc7cba6mr2904960eec.28.1768980298950;
        Tue, 20 Jan 2026 23:24:58 -0800 (PST)
Received: from gmail.com ([2a09:bac1:19e0:20::4:33f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70d4324f5sm2724899eec.8.2026.01.20.23.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:24:58 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	kees@kernel.org,
	andy@kernel.org,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	charlie@rivosinc.com,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	linus.walleij@linaro.org,
	nathan@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 6/8] riscv: lib: add strnlen implementation
Date: Wed, 21 Jan 2026 15:24:38 +0800
Message-ID: <20260121072438.6646-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120065852.166857-7-jiangfeng@kylinos.cn>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn> <20260120065852.166857-7-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_232501_137187_918D467B 
X-CRM114-Status: GOOD (  14.72  )
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

On Tue, 20 Jan 2026 14:58:50 +0800, Feng Jiang wrote:
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S

Branches that test maxlen can be replaced with Zbb minu instruction.
(see below)

> +	/*
> +	 * Returns
> +	 *   a0 - String length
> +	 *
> +	 * Parameters
> +	 *   a0 - String to measure
> +	 *   a1 - Max length of string
> +	 *
> +	 * Clobbers
> +	 *   t0, t1, t2, t3, t4
> +	 */
> +
> +	/* If maxlen is 0, return 0. */
> +	beqz	a1, 3f
> +
> +	/* Number of irrelevant bytes in the first word. */
> +	andi	t2, a0, SZREG-1
> +
> +	/* Align pointer. */
> +	andi	t0, a0, -SZREG
> +
> +	li	t3, SZREG
> +	sub	t3, t3, t2
> +	slli	t2, t2, 3
> +
> +	/* Aligned boundary. */
> +	add	t4, a0, a1
> +	andi	t4, t4, -SZREG
> +
> +	/* Get the first word.  */
> +	REG_L	t1, 0(t0)
> +
> +	/*
> +	 * Shift away the partial data we loaded to remove the irrelevant bytes
> +	 * preceding the string with the effect of adding NUL bytes at the
> +	 * end of the string's first word.
> +	 */
> +	SHIFT	t1, t1, t2
> +
> +	/* Convert non-NUL into 0xff and NUL into 0x00. */
> +	orc.b	t1, t1
> +
> +	/* Convert non-NUL into 0x00 and NUL into 0xff. */
> +	not	t1, t1
> +
> +	/*
> +	 * Search for the first set bit (corresponding to a NUL byte in the
> +	 * original chunk).
> +	 */
> +	CZ	t1, t1
> +
> +	/*
> +	 * The first chunk is special: compare against the number
> +	 * of valid bytes in this chunk.
> +	 */
> +	srli	a0, t1, 3
> +
> +	/* Limit the result by maxlen. */
> +	bleu	a1, a0, 3f

minu	a0, a0, a1

> +
> +	bgtu	t3, a0, 2f
> +
> +	/* Prepare for the word comparison loop. */
> +	addi	t2, t0, SZREG
> +	li	t3, -1
> +
> +	/*
> +	 * Our critical loop is 4 instructions and processes data in
> +	 * 4 byte or 8 byte chunks.
> +	 */
> +	.p2align 3
> +1:
> +	REG_L	t1, SZREG(t0)
> +	addi	t0, t0, SZREG
> +	orc.b	t1, t1
> +	bgeu	t0, t4, 4f
> +	beq	t1, t3, 1b
> +4:
> +	not	t1, t1
> +	CZ	t1, t1
> +	srli	t1, t1, 3
> +
> +	/* Get number of processed bytes. */
> +	sub	t2, t0, t2
> +
> +	/* Add number of characters in the first word.  */
> +	add	a0, a0, t2
> +
> +	/* Add number of characters in the last word.  */
> +	add	a0, a0, t1
> +
> +	/* Ensure the final result does not exceed maxlen. */
> +	bgeu	a0, a1, 3f

minu	a0, a0, a1

> +2:
> +	ret
> +3:
> +	mv	a0, a1
> +	ret
> +
> +.option pop

--
Qingfang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
