Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ADBC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 21:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KFaIa8sFsHtzX1/4I/OiRTlbRDdzHsoAY49dQQqajI=; b=v8oA9iBBooboFm
	OEV3AA4eAJd3zcmmGb5inmEI3zRQfWuHwM7Grrx2UUd7yRpGib9dgy20zSeaj77u1JZtBCW7Ptad+
	wj5tt6Nme/B7TUGOIa3jy9riaWeVtC+RqFNKyPntXFqFuNo3CPDyOsTQY35TkflzHIOAVJ3/IlXcj
	5f9et0ozLzmRPf0x7b5XKiDdQjbpzCoCf5N4uDDb5iVi/DKNzSUDqIiKHhKe2ZLfTLGAtWyDfaohQ
	YVY80i2gk2ZDqdwiX/mtn3UN67thOvfutqu6cGU5Ow1N1OCbFmBZYrEIvbEc5bm16uxQFY0zOBZ6z
	fS6wI54911HPBBrmBiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsWZP-00HYcV-Le; Sat, 21 May 2022 21:23:31 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsWZN-00HYc6-Jl
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 21:23:30 +0000
Received: by mail-ej1-x630.google.com with SMTP id m20so21576999ejj.10
 for <linux-riscv@lists.infradead.org>; Sat, 21 May 2022 14:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NZRl9WfAi8Hu5aZvgMi6HmqtL/sno/YXJR5gXhDUgGs=;
 b=j/rjDl32tqK3aorSjmLLrMXEqFnq/uKYiBpVmy0tQvlT8cMhmvC8llr89kD8UqhVZ7
 4R8XIiPR5wpyJytoOJzV5UlJfT39+VPZMNzWVADDqskAlPWKaUCeqo4jv/2A9tbn8Upb
 FcEU63SwLjtZD9FTB1zmyVmYxydSDraIYUnBJOsZYHcz3VI7ATCYooT6j7hrm8XcJu5P
 OlaO/EoDYIcTMpmSzvB9w9me3tj2Y6bOdZh4U1I58nkXlwHIud55Wk7dpP95zBCPPXqp
 Yxwefh3x/HMesohQ3wX8vxmkbZmo3pJJJEXmjcKPRaw/7nNhieZFfTvXSwbg5Tbf6ND1
 jxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NZRl9WfAi8Hu5aZvgMi6HmqtL/sno/YXJR5gXhDUgGs=;
 b=BIkrdjGDr5KmDpF3HuXfPO+rHBRtaUnssywm1/gVwY+0/hQjArrT5tJKnIUxn4nXvX
 wkBiMwcxbS2yfX3yJj3m5OTP9rlhH94NxOjsreX4JnZk+bNi1GsGMXmTTK/Oqze+Kfug
 0o4hmQKSanELkPZeVm1G4mIDPzaifhdtayuldtR+yaUf84xU734sAijW3gLsarhBBdkt
 GEMr0PUK7mn75PlQtp/PHOJkumo6b7D5HXWoXG0D9+O4rWHC9jWzwI4X7v9jIno/qHdK
 AxLnMmnCaWBWkbVwzCP7uEYWIS59pB2SceMEiIv78lXF1DvSCdklyh3x+iFggCs0JbbA
 UwIA==
X-Gm-Message-State: AOAM531e3jcGAxxYcLS1CpdB7S2QBOVrC8BBNzD7lajpY9xbVTPqHQbi
 ME996BrrORsrCJtsKerp3y4=
X-Google-Smtp-Source: ABdhPJwCEIG6Kdp76EUWhdjQ8pgPyFpcWSsQ1SJ38+Ub5NKoff1IYpZz4QW7Ui3+Zq2WDAf0/2yxBQ==
X-Received: by 2002:a17:907:7e99:b0:6fd:c2a2:9620 with SMTP id
 qb25-20020a1709077e9900b006fdc2a29620mr14591010ejc.554.1653168207292; 
 Sat, 21 May 2022 14:23:27 -0700 (PDT)
Received: from mail (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
 by smtp.gmail.com with ESMTPSA id
 ca7-20020aa7cd67000000b0042617ba63absm6035708edb.53.2022.05.21.14.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 14:23:26 -0700 (PDT)
Date: Sat, 21 May 2022 23:23:25 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 0/6] RISC-V -march handling improvements
Message-ID: <20220521212325.lw6fdzsmlwvioggv@mail>
References: <20220402050041.21302-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220402050041.21302-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_142329_707966_C430CE25 
X-CRM114-Status: UNSURE (   7.00  )
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

On Fri, Apr 01, 2022 at 10:00:35PM -0700, Palmer Dabbelt wrote:

Hi,

Thank you for these patches and please accept my apologies
for this much delayed reply.


I've just pushed the Zicsr and Zifencei patches since these solve
an immediate problem and I've some minor questions/objections for
the other ones.

-- Luc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
