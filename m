Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E509AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3UcdnGoPSWoYFqdez6uonHQTdlApb178/D5YTUXRkk=; b=dx8l6DZA96iSsl
	2sYp+o1ucNKkDxbC2ggkktuTv9qsVJYuQnUUV1CtOp/MgKE2WuQGwGxLAygDbtpD9TLwiarRnUGAf
	6isFCqs7L98ftNMR+IxlPlZYAXN7qDc/m52RcuyDdqs8te+8S3i+C1QDClZS77FcLgCdKZOLUyp7R
	LauPIh0OOVrJ+P3izxNcOcXbXcX5euSgbirY2lvn1eYkPfLJ2Xg1Gs3sdocIRPzrNIotfaZspX0Ti
	o80UNpDJsFduej0aV9CC+ELlgf86vcrz5hHUBqnBYb82p5XMUadD5evvrH82ypeWGk12M4TmicTa1
	yE7AWT9KnpsM9cTGrJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p582t-002nu3-WD; Tue, 13 Dec 2022 16:22:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p582n-002nmQ-2x
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 16:22:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id w23so254156ply.12
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 08:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncjGKUv9rVKBS01SubO64Vlg5d0EAsJr2WrmHlvF8aI=;
        b=cnUqemJOaNWoqJLcIuYLWCoRsH9YB2t97z2oa9JSDcYgoo0bvs3Kj5CADWkH1OBeYk
         rKCZqnz0LFuYMj8Zzm4oHFWfOGN/TIxEjZr4pGWj6UrjzQB7hJvdC2oyXLIFkJ5fWqf/
         plp009WBpFJF/9BWluCVyOS9kYOIJUGyGnoswOrW45HsmdRhlH9EJvKVuPQOJUTrEqwg
         V06kj/pi4+vrfAYBTkVDyhWhB+boE4BJ+SL6Q8v2pAlOEdCdiStLZRAJ2HeKJRb0Q06v
         IuvfHh1x64RMZCWb+xo50o5sBxXzR0Giz3UyzA0KxixIScFccjVRbwnuEYxFl/LJXhLB
         C7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncjGKUv9rVKBS01SubO64Vlg5d0EAsJr2WrmHlvF8aI=;
        b=KPTbEiNLlAKItqJEFi4Et935zp3r7k+jpLaID2HPjlLwbvr0zQrjTKTyoLDPCet5sy
         kfki3/i/OjjMie31OiqOSLPr0jBiuTLEBzPaUMYX40zUYXYffakS8RadZ/e08BGTCxyf
         6c67rDZOKV/0d3N6ayG/0MQkeb+hZwco/xNSZRsZ+kbA1F369aJKWJ9hDsDkS2Y5ymfI
         Oxy7MD62NXCdWWYgT34bgdM+LnleOgG79bizRLRrUD5yDSnDgok9iIiTTeiAkJBfs8wR
         oFwOYAi0mAqNM7+fo0KTfOQqpbfzVDicCyzgUTo4oqJpkDImbj22zBcubhkrjzpVeSFg
         Qjjg==
X-Gm-Message-State: ANoB5pklZfeaaZCBRXW5d5ub3qWyiEIjbY4+e8bAOx32tUyyYTuDzuYt
	d4mAUzpSPFcDnwC7Tj5Hx3yKFg==
X-Google-Smtp-Source: AA0mqf6q98v/+SKapWr16Y/du8552JbDbZLpSka+p8FGxLVAGnmPE2jwQ0akSy8RoMFoGgo7+YOjZg==
X-Received: by 2002:a05:6a21:3942:b0:a4:c01c:5e1e with SMTP id ac2-20020a056a21394200b000a4c01c5e1emr25872268pzc.47.1670948518785;
        Tue, 13 Dec 2022 08:21:58 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id b27-20020aa7951b000000b00574c54423d3sm8096315pfp.145.2022.12.13.08.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 08:21:58 -0800 (PST)
In-Reply-To: <20221201135128.1482189-1-alexghiti@rivosinc.com>
References: <20221201135128.1482189-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH 0/1] riscv: Fix P4D_SHIFT definition for 3-level page table mode
Message-Id: <167094850229.7325.7145229658614333981.b4-ty@rivosinc.com>
Date: Tue, 13 Dec 2022 08:21:42 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
  Qinglin Pan <panqinglin2020@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
  Alexandre Ghiti <alexghiti@rivosinc.com>, linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
  linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_082213_159869_74C92AA9 
X-CRM114-Status: GOOD (  10.40  )
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

On Thu, 1 Dec 2022 14:51:27 +0100, Alexandre Ghiti wrote:
> +cc linux-mm since I'm struggling to know how bad is this issue and
> if this should be picked for 6.1-rc8 or not.
> 
> I tested this fix on an Ubuntu kernel in sv39 mode without any issue
> but the version without the fix seems to work fine too, either this is
> not a real issue or I don't exercise the right thing to make it visible.
> 
> [...]

Applied, thanks!

[1/1] riscv: Fix P4D_SHIFT definition for 3-level page table mode
      https://git.kernel.org/palmer/c/71fc3621efc3

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
