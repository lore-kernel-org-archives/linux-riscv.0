Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A167C35FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ywZTRQgKt5qqDF8xbEXBNAvPu7U2dN9du/Om1+oBXik=; b=3rlqJoqsoloF6o5+4vhksexXcT
	t26dEajsKzJc4qdGvyklxzlSaozf2nXZsQz8VC7nhu1z89sUJFEjp5SzAnbyFsbqBHItpmuFfeAUz
	ywNt6m99FiFLQ23a8GoXTZVJWfNMqlUowBK7A5OvoAsjcVuG3IVCDZ0FUDHwpMqRRUvQzhVzEUoEw
	WG2HZ07a/Xyn4ApgftqpLJfSftfBMMdyngnTMi2DeLNjlXIBU6FeFuXoQfMtBiROF4qf1aivM1lpX
	JI/QPrMtU16UoCy6ZRdLvGp0HREIC+MHR8rQ1hbpYS53g7C4e1583xgcameS7FXe2y1Sr6Ud6Uif6
	d9O0q55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYXL-00000006G1R-3d4u;
	Tue, 17 Sep 2024 13:46:35 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYXI-00000006G0D-0OEv
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:46:34 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7d4fbe62bf5so2642949a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726580791; x=1727185591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBhjPz8Bcd6zPQmI2z4WaicXIi0T3Qbuz8t8Jo6otE0=;
        b=vuY87yJp923DaRrK2i4DPBxxfHTXcfRkbx9l8+NuMBs0Q73Cd6rPeD5Hmuw9c7YZVw
         KPcws051iAiKFMCNIyGg7O+xquvTb5uPwwnA9vZwr7c9HkM9hnCJzlX2fxkKoj80qxCu
         pXB/hzVB6JvunuPCbjuOM1dFolfyHpAuXINz0WlNOmlnZwk6e5gjD7rPJCiOY+JlTzFv
         F8jAVF+uCXo/1950Wt0GECLzxBlKFJoqsBJ5LZyGFEg2kVUu7mdk9FZSjWUanR19LVxD
         XvpqU+V+fzk2wkxECrLRqUQIGiuI+4w9+weGYKpSon1W/db1nOStE4Ro8/UEieCGp9jk
         kn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726580791; x=1727185591;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBhjPz8Bcd6zPQmI2z4WaicXIi0T3Qbuz8t8Jo6otE0=;
        b=eTN6oXSt4rlUAuRxEjAjPgt+08PfTaDFB4TJT2spFQDxBmDQ0LQviVXKQWolhuuPHn
         qsT1QCAMl5YTO55Y5ZGBvhQVMe0GpXLtx6W6SKqiSoaO2Bua3rzj0iRTyI1dkZWFROMs
         yf6VF9odn9FmbFrIgtoKmItf9N1iTeMVLxUmyErsq1j8vl3O/fnFjgA8FntxNnJDrV/J
         0WcV+Fp/HoUX6zkP2OHpGlvWZ6iRaMXYvYbX+kkDUmfI797fDGk4hIypP6guPhbIynrR
         EPQpaotWdVcahfM76EYDJFQkeAN+1eKVPREM/nuvQWY+Uu9phpeiBm6IECN9Jq8iIiNQ
         SZNQ==
X-Gm-Message-State: AOJu0YwfGmBrLbicGvYqmVkV3/GRPa0YoVJmqTC+70vSmq3J2JJEnyPh
	mfmdAhAJDxZOMGXu4WMlA4Pl0j4WhKn//NbX9dayRG1DySN/g4Al9pAVdtK6yBUOf3dC6Rw+jc5
	upDNhig==
X-Google-Smtp-Source: AGHT+IGRij2epjt/EcDb987TZw2ZnKg+45A8Lu8cTOPiFJlCSlcfAH5qv2E5B0J/Q/7U9XvytPaLiw==
X-Received: by 2002:a05:6a20:3949:b0:1d2:bb49:636e with SMTP id adf61e73a8af0-1d2bb49641bmr16824884637.35.1726580790582;
        Tue, 17 Sep 2024 06:46:30 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a9cab5sm5204520b3a.5.2024.09.17.06.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:46:30 -0700 (PDT)
Date: Tue, 17 Sep 2024 06:46:30 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 06:46:26 PDT (-0700)
Subject: Re: RFC: extern illegal instruction trap and trap RDCYCLE
In-Reply-To: <20240917130853.18657-1-ben.dooks@codethink.co.uk>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben.dooks@codethink.co.uk
Message-ID: <mhng-ac746ffc-8099-447d-a45f-772550f23290@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_064632_158033_EDDD5F1D 
X-CRM114-Status: GOOD (  18.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 17 Sep 2024 06:08:50 PDT (-0700), ben.dooks@codethink.co.uk wrote:
> This is a RFC series to change how the illegal instruction trap
> is handled and then how to trap RDCYCLE and emulate it with RDTIME
> instead.

Only 1/3 made it to lore for me, not sure if it's just stuck somewhere.

>
> I did this when we found multiple libraries using RDCYCLE and
> upgrading multiple runners to newer kernels caused many problems

OK, so I think we're kind of just stuck with RDCYCLE then -- it was part 
of the base ISA when we merged the port, and every time it disappears 
we end up breaking userspace.

I'm not sure what exactly the right way to do this is: IIRC there's some 
perf-related hooks for this, but there's also systems that just don't 
implement the RDCYCLE instruction at all and thus we'll need some sort 
of emulation for those.

So hopefully the other two patches get through the lists at some point, 
but I think in general this is a reasonable thing to do -- or I guess 
maybe a completely unreasonable thing to be stuck needing to do, but no 
way around it ;)

>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
