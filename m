Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511E0C433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 04:36:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC1772312E
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 04:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC1772312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Mfd48w6FjT3XM0vQNon0dSfGtc5X0e2d7s8LhpFyc44=; b=eyk0N83Jxw33IF6E2Exw9l00t
	xs/ou3QQ9ohUNcRmbdD+yqhzoUT/tND1BsIZhnkkDNKuCNkfGsBnzieLq/H74rZuTKnvZwgFshqvH
	Uyj3S1XsgLDIUaMLWkFbFgNMC9JKT0NrnA0qCv2/Yaktz2p6QOyki36tqFsdNXCETLoDPxdl2QUlO
	8bBqjwNBf8Yd+79Wwut2d3sWryLsSMH4kwHEPyZYtQKAs+kirVYwocZhpYMxCmXokANi/eet9hzH6
	ayctQ1BehtKDz0VJBt14gRdsfNq0CyeMSukG7HRB6rMdieaeFrsEg6njC6PEg6uoPnEtQZ8OGdXp1
	v0iThsrWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzXtc-0005Ya-TB; Wed, 13 Jan 2021 04:36:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzXtZ-0005X2-Lx
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 04:36:34 +0000
Received: by mail-pf1-x435.google.com with SMTP id h186so479246pfe.0
 for <linux-riscv@lists.infradead.org>; Tue, 12 Jan 2021 20:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ogtrVGZ6pAo0ADV9qwAesULOZDDOSRXRQwB1gmpCX8s=;
 b=JNhHVXk/UfFxEOuGHLDZxxdRz1GzMEbSz/1g2abyF+tnPs89EwF+oUHBl/iUnN2nB7
 ZBFIe+8+vaOSORcohr2CIiZgPS0JcspM7MA2KNFtlDMc7fROec2PxygF7aMY/4w4eDDD
 nCZV4Owfn2uRfJAPdDDUHOLJzbcVWmOUaN8S5OuwzYeYjvAIwMPuVXYfc9bapC35N54I
 EAhu8TUwqdg3MKG3P7ka9e69K9oxhoExLRsraaeuIWagPnh4UKhR1oBlq8Yr6hgXAiGs
 bvOsXbIMH8ob1IA1dzYdQNBSYnzfM6hD0GampWUI8HEHlIcETCUyVdf/JVbOazJq7n5R
 OpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ogtrVGZ6pAo0ADV9qwAesULOZDDOSRXRQwB1gmpCX8s=;
 b=OzINGSlo9YDupEUIK1mCnMtaK3mdNJoZnaV60rp6qjOx4WlDxvHcV/05873Jsit1//
 2w5vOZVtMRkFoKFg3A/dpX9SZRZgyrRWqBvZ9lwB4QCqqzgFjM1h4+ZzLiZcm2E734NE
 Scfoc/HdTQt9/Mnrrt0TpDPxrVNP0Y5+UOifqBY6iblZ/S7Vxc0tc9gvJxFkTNvBqsUQ
 tFLunjHttNbkVlJ4i+UaXWDfcpucDdxOCSFB8gVlDy5QA9Ai/mCetybw4LAfKZ8dvaN6
 ncatyz2UMiizOQSopoCG9XbmKDu7vinak5Gp+jBye2NECdpcKEr8tTg3WvDv4EPSdBMO
 wPCw==
X-Gm-Message-State: AOAM532abbRGYRmIg/gqRc9rZbscPucANJAiq+hODgbInEt0+MijOFB3
 KrmXwshpoDP8bU/o1wm8bot/eQ==
X-Google-Smtp-Source: ABdhPJyZQ4/PvLkpMLQMJw9Yk9cgwnCJD0Cvh1T6jj83SqfE84Pw82Sr82NFhWGF8VJvPwBXBeP7cA==
X-Received: by 2002:aa7:8209:0:b029:19f:3002:513 with SMTP id
 k9-20020aa782090000b029019f30020513mr257917pfi.49.1610512591844; 
 Tue, 12 Jan 2021 20:36:31 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a22sm747129pfa.215.2021.01.12.20.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 20:36:31 -0800 (PST)
Date: Tue, 12 Jan 2021 20:36:31 -0800 (PST)
X-Google-Original-Date: Tue, 12 Jan 2021 20:36:21 PST (-0800)
Subject: Re: [PATCH] riscv: Fixup CONFIG_GENERIC_TIME_VSYSCALL
In-Reply-To: <CAOJsxLGwdrw6t665+Q8k5o_2P8y7fxNV3s_SpQLD_toPg8Db_w@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: penberg@gmail.com
Message-ID: <mhng-2092c5f2-ec27-4a8e-bb91-4c4ccdc1c5e1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_233633_732863_14E8DCE9 
X-CRM114-Status: GOOD (  11.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: guoren@linux.alibaba.com, vincent.chen@sifive.com, anup@brainfault.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, guoren@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 03 Jan 2021 02:11:35 PST (-0800), penberg@gmail.com wrote:
> On Sat, Jan 2, 2021 at 3:26 PM <guoren@kernel.org> wrote:
>>
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> The patch fix commit: ad5d112 ("riscv: use vDSO common flow to
>> reduce the latency of the time-related functions").
>>
>> The GENERIC_TIME_VSYSCALL should be CONFIG_GENERIC_TIME_VSYSCALL
>> or vgettimeofday won't work.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Cc: Atish Patra <atish.patra@wdc.com>
>> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
>> Cc: Vincent Chen <vincent.chen@sifive.com>
>
> Reviewed-by: Pekka Enberg <penberg@kernel.org>

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
