Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319D0C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 17:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXhWZDrbAk7KN0lLRUF4FQLOki3n6A1iOoP8L4yXAPk=; b=gBZzx+r/mB2bJ/
	YJJTwCHO2hHJH0EjHrShBjE5aa1Ws3IRv8/bLPmMN2p08xlaI5CNO9cCXJLYF515WLr9Hcwl4tRLK
	q+HFdfHtZSjYLwpsyeXkTrKKkPpVjphCaEdpPGokAquRdV+2b8PhXx8PqBFDdjjq9MRfXEQErjJVV
	vWaWJtzGQ8V6RSJ8CTueCnUJtKTXX4YdXT/Uvmh6vnBXkj8n7G5pUC4s4cOiCc1y2sRr5+ozJsR6y
	pUox0DKtZTkUZrM9MOIgI3nUm8dHIhA0Cj7PgsrU9DTodooHzmMDXeJUURm1QSxvW1CNrOrGKC3Iu
	Ot9U7LJpRFMNWThMFC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuIk-00000002h7W-1jNj;
	Fri, 02 May 2025 17:35:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuIh-00000002h6u-2EEM
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 17:35:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22c336fcdaaso30159315ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746207350; x=1746812150; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYhAVQlokiByUgWXBup9K48iVS+b0vgtDdhC/WcTVzQ=;
        b=vXdBGIBnLqyuuqxQhZlfBzN1mmXbabBiYGp+fj6sZ7e87ugiD1AUC2hBb6Bcm7A0xF
         Ue0dfpeeMFrK9dU92PG+OPdJzGyGANZO78/gwmrVUkx38BJx+PziwsFr9yhMrmKt27yW
         YwNaGIgfutPtlcjucRjsxIbBclpBTlO+8hTXN3Cug0kwkE1yKtjDi/2F4Q5jmHNgu7cX
         CXolyYAnOV8nQPC7lPf5DfaEsEAAvB8HepdD/mit18vR/dSa79UaZP5sJR3isI9HxzpZ
         XV26sP8NCpx5IEia/UXaRvQPCCuMkk62yxeuMHogazULM0scBkzjcWCYzWdQ9qXg6pnb
         HQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746207350; x=1746812150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYhAVQlokiByUgWXBup9K48iVS+b0vgtDdhC/WcTVzQ=;
        b=ImZrygd+5t50IgihR95kiuj90iH99tzOslTACQbYC+ESHT4VItE+/9iTQLFW3/AbJW
         9b+ymp8C6h84wlKzW3JgCWNz4FCHPmSRN1OL6YAl04W00MB+6GG8UJtcAiJRqtvQ0fap
         pn/BwIk5CrEC2hFRxsTR6qC4YgY/9++IQiPVO7y4md3sq+gwbu/PyyZRnhfB7XljE2jj
         GSSvHfwtHCkIZY8T9PYgjnpV/pzKsoLpOtEXmhu2jJk5WOn7yCAXRbhZKuFu4+GHwgiU
         qLALTKWE/gTPafZA+91GhMIL9X6M2gliM2AmyFF9rIaYHzKx0GeW8wGlN6kU2xEg+WHt
         R4Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXpXzmuKujrLWt1HdS8UmyxNHtIho0+qhPdBP2IAGI8vbOX1FbJc7mOTijN59UVVv+9Q4Cpr/KjQQ0cCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyM64pYqYGY6SsbyX2hiCSTjVFwg0Z+WGS4Ietr2YAp0GgUY+Ri
	OBflAmU+FwGO5SAxMl5JL074c3fXR2KgPu0ZpeHph57TU7+WPPaMUHrgH7vBu2o=
X-Gm-Gg: ASbGncuGf19wIYiPehQT4kisrWhUJzeUMeO6BHWpoiRMzfHoYVYmqOHc4rfNiTsp1us
	tkTZcsO0gpKe2lFAPJmAdA32CtjIyDZD3aL4hNYk4Q6Wndfv2pHj5JtVe9H6eHwTsPs8H13tG8G
	SJ2BNoVjqOLbnuhxoZmQd2Jcuiv1VugGfU9wKVz2Jy0a1C5rIetTlrGdK19L6041RzjOX52rhjJ
	CFYXly+RppMWeb5aI80/zzYoCFVDxE3LQ5JGmtejHH4tR6jKM7eHFuYqXCuffiLBLNq8IKV6hFR
	bKufoA7+iu2AXU5NjGDDu3xG6xCImTuaPujRi410ZBkSy/6RJ8ff5ilMkg==
X-Google-Smtp-Source: AGHT+IHBxa82j3Roorwj2Et3r1OrV5OkcZFDFTDmDeIMXs4BMM/H2pad3CjPCcSgOfU4YoigoF7IqQ==
X-Received: by 2002:a17:903:3b88:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22e103965femr57603255ad.40.1746207350292;
        Fri, 02 May 2025 10:35:50 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232797sm10306915ad.240.2025.05.02.10.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:35:49 -0700 (PDT)
Date: Fri, 2 May 2025 10:35:48 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
Message-ID: <aBUCdA0ZSQL1n3i4@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
 <20250403094425.876981-4-m.wilczynski@samsung.com>
 <Z/BoQIXKEhL3/q50@x1>
 <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
 <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>
 <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_103551_845019_D58B3D54 
X-CRM114-Status: GOOD (  35.01  )
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

On Wed, Apr 30, 2025 at 09:52:29AM +0200, Michal Wilczynski wrote:
> 
> 
> On 4/30/25 00:29, Stephen Boyd wrote:
> > Quoting Michal Wilczynski (2025-04-07 08:30:43)
> >> On 4/5/25 01:16, Drew Fustini wrote:
> >>>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >>>> index 527336417765..d4cba0713cab 100644
> >>>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >>>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >>>> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
> >>>>                      #clock-cells = <1>;
> >>>>              };
> >>>>  
> >>>> +            clk_vo: clock-controller@ffef528050 {
> >>>> +                    compatible = "thead,th1520-clk-vo";
> >>>> +                    reg = <0xff 0xef528050 0x0 0xfb0>;
> >>>
> >>> Thanks for your patch. It is great to have more of the clocks supported
> >>> upstream.
> >>>
> >>> The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
> >>> 205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?
> >>>
> >>> I see on page 213 that the first register for VO_SUBSYS starts with
> >>> VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
> >>> CCU_GATE macros use offset of 0x0 instead 0x50.
> >>>
> >>> I kind of think the reg property using the actual base address
> >>> (0xFF_EF52_8000) makes more sense as that's a closer match to the tables
> >>> in the manual. But I don't have a strong preference if you think think
> >>> using 0xef528050 makes the CCU_GATE macros easier to read.
> >>
> >> Thank you for your comment.
> >>
> >> This was discussed some time ago. The main issue was that the address
> >> space was fragmented between clocks and resets. Initially, I proposed
> >> using syscon as a way to abstract this, but the idea wasn't particularly
> >> well received.
> >>
> >> So at the start of the 0xFF_EF52_8000 there is a reset register GPU_RST_CFG
> >> I need for resetting the GPU.
> >>
> >> For reference, here's the earlier discussion: [1]
> >>
> >> [1] - https://lore.kernel.org/all/1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org/
> >>
> > 
> > In that email I said you should have one node
> > clock-controller@ffef528000. Why did 0x50 get added to the address?
> 
> Hi Stephen,
> In the v2 version of the patchset, there was no reset controller yet, so
> I thought your comment was made referring to that earlier version.
> This representation clearly describes the hardware correctly, which is
> the requirement for the Device Tree.
> 
> The manual, in section 5.4.1.6 VO_SUBSYS, describes the reset registers
> starting at 0xFF_EF52_8000:
> 
> GPU_RST_CFG             0x00
> DPU_RST_CFG             0x04
> MIPI_DSI0_RST_CFG       0x8
> MIPI_DSI1_RST_CFG       0xc
> HDMI_RST_CFG            0x14
> AXI4_VO_DW_AXI          0x18
> X2H_X4_VOSYS_DW_AXI_X2H 0x20
> 
> And the clock registers for VO_SUBSYS, manual section 4.4.1.6 start at offset 0x50:
> VOSYS_CLK_GATE          0x50
> VOSYS_CLK_GATE1         0x54
> VOSYS_DPU_CCLK_CFG0     0x64
> TEST_CLK_FREQ_STAT      0xc4
> TEST_CLK_CFG            0xc8
> 
> So I considered this back then and thought it was appropriate to divide
> it into two nodes, as the reset node wasn't being considered at that
> time.
> 
> When looking for the reference [1], I didn't notice if you corrected
> yourself later, but I do remember considering the single-node approach
> at the time.
> 
> > 
> 
> Best regards,
> -- 
> Michal Wilczynski <m.wilczynski@samsung.com>

I chatted with Stephen on irc about setting up a thead clk branch and
sending pull requests to Stephen.

Stephen - are there changes in this series that you want to see in order
to give your Reviewed-by?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
