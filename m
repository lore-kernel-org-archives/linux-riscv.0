Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F4ECA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kjf9BOILBnxrbC1e/KGfHKh/AV93edME9T/3FoUMxI=; b=AUjUhkcbOl/OO+
	rSukIcnL6aB77Morrt57RdgPeNXDs5dl0Rj2G45m5IJ+RjgBaYMWLCofG6pHUlyxQjUwnkEq4uSYO
	0haU2bVpvYotPCrb236WzTug2YktaF0Edvd1hlNjuIIFTvSiw+F/lsIsGO8LrEfKcZkKpJ3maQH27
	2xOdOlMQJ+2jwBSkxAFTyKJMYZMfPtPAVsGqsXTDj/0goTancR4x2KBcMlDJWiu9Qs0nK3Tx7HIAG
	u1fNE73+pli8LEbaWKiKA1AxMeL6l7BSenlWRQzfxDChliytE/RsMlzGcm4frEyjIAEhs+r449nHp
	V8OOz3Ir/jRND2+p7xwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChW7-0000000CEEu-2OAs;
	Fri, 02 Oct 2026 17:57:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChW4-0000000CEDx-2JRE
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 17:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790963871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YRmfniRYY3gDZtpbulPtdSLopqAgCcIdSXqyEPuAkSA=;
	b=ZVLWSCyOMZYM4xQeejfTvNkawDgetUWv9+MDLvrEqW9jDdyR3MXd/T+7Qf6y0a8rTy6YG+
	wIa3aS+ZQuqXUDvP4G2TNiY3QRE1FuYPmBfzTjCZ3+dWVaY6pGodwq4XZYwgGbfLmKuFKi
	1IlcN/btCkNpJHt9CWAIof8+1Crdy+c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-622HDaWpP66OBfJBs54P8Q-1; Fri, 02 Oct 2026 13:57:49 -0400
X-MC-Unique: 622HDaWpP66OBfJBs54P8Q-1
X-Mimecast-MFC-AGG-ID: 622HDaWpP66OBfJBs54P8Q_1790963869
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338c59f90dso4742691cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 10:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963869; x=1791568669;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRmfniRYY3gDZtpbulPtdSLopqAgCcIdSXqyEPuAkSA=;
        b=xd6UXFfpef5MMSzM/c6wBfXARuetfIBU4dTuFXQFZM//T1vJmdpMuaeXgJumq3EhCk
         Q2CjZRxV7NVK62tb+mn5Q7vUM8t1eLMvPrJXd1juQ6n3+rD5QIVjHyGGFlgFF2G6a8p3
         6iBbqO/F4AiUN1Zg0hTZDmBBZzVjPFR4uPUoukiryOtaNxzP5kYYDkDILl4mhx5yE1XW
         t532lz3bcEHIZ3RJh9y2FcnZLoUCyzkhhR7rYyEGbVzMB494ih3lrMuz1L+jsdLJgags
         5fbchKj91Q7pwLhqUiqd8DStfDXTfuS9fRcwCR8INXEUrODpGCBh5cKKgtrYjG58hLCe
         7fRg==
X-Forwarded-Encrypted: i=1; AKwUvBzClWKk0GRNbw/gZHRIpcHr7BPQpCpfVzy5muvcRw0VWxJj/H6ypjFBWqkqLUjROOAlkr+bSaLRWIEF2w==@lists.infradead.org
X-Gm-Message-State: AFuF++kM71S6HwJbSDGYAQ17gERg3syMk8JdSZv9wi1W21WJ23vTT3wj
	P/vp+AsK6URasjse0VsongnN0PzsB6fQjq8hDwdF0hSk4XzHlOmHGr5yGd1h6mQdkqowRRTMGpS
	QaR9DnHxpcSUI+ZP+1u14ACnJXSPVlRbJylgbLnmqoe76+Vl328MYnQbJA0N5Sp982q+jZg==
X-Gm-Gg: AYBFou1TI0fbjqE886uj4dnSJBAQvxSCoo/2MAjxwkrDdYFi+a6KR7fJw/0LpbGc9//
	jdulNA36ylFRSUEsV+a+3pcmjguk5Qsef0jqlMh1A5GMJkQUl3JvLKN+P/Lfhqt7x+FHBPJJFHQ
	qUyBbxGkjI765QHPDS0M3oEnHxrA/7W4C4bw975lpJPKCbz1XBJA5zaUHHBpJ777kuifUFOvd66
	Tf/gu8/NBpj0LFReZeKliGnjrDE/ERoN1Z7VEVOdqGijkKSilxvwS8pm7e0+PTQ8VWvBoeQYsRB
	DeAiGLOl8yVv/jjh/Y2mm5FRhwyO7AiWCcrulyvef/nCRI+Y1wPcaL0pw2XNU0dYhaYD+kHj9A=
	=
X-Received: by 2002:ac8:5750:0:b0:532:8063:4ccc with SMTP id d75a77b69052e-533831271a9mr130026061cf.3.1790963869177;
        Fri, 02 Oct 2026 10:57:49 -0700 (PDT)
X-Received: by 2002:ac8:5750:0:b0:532:8063:4ccc with SMTP id d75a77b69052e-533831271a9mr130025521cf.3.1790963868585;
        Fri, 02 Oct 2026 10:57:48 -0700 (PDT)
Received: from redhat.com ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398bdd010sm33168861cf.19.2026.10.02.10.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:57:47 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:57:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <ar_wmUWEXgIzq1XM@redhat.com>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
 <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
 <20261002-crimson-unwrapped-b067e86de38c@spud>
MIME-Version: 1.0
In-Reply-To: <20261002-crimson-unwrapped-b067e86de38c@spud>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uyY565KsGb_9jHIiXabVBaZGa0gQggrhz34_4Fi0fNQ_1790963869
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_105752_726891_F95272B3 
X-CRM114-Status: GOOD (  15.04  )
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

On Fri, Oct 02, 2026 at 05:33:24PM +0100, Conor Dooley wrote:
> On Sat, Oct 03, 2026 at 12:28:40AM +0800, Junhui Liu wrote:
> > The external CAN and watchdog clock inputs are not routed on the MLKPAI
> > FS01, the only board currently supported. Drop the two fixed-clock
> > placeholders from the common dtsi, as fixed clocks require a valid
> > clock-frequency property.
> > 
> > Both clock muxes select their internal parent clocks after reset, so
> > the CRU operates correctly without the external inputs. Keep only the
> > required oscillator input to the CRU.
> > 
> > A board using these external clocks should define them in its own
> > board-level dts and override the clocks and clock-names properties of
> > the CRU node.
> > 
> > Reported-by: Yixun Lan <dlan@kernel.org>
> > Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> 
> Per the v1, Brian said he would rebase the clock tree, so I'll just
> squash this into the original patch I think.

It's already rebased, and dropped from the clk-next history.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
