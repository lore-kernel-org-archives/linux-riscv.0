Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA08C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 11:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pc6UrGXt6D/Gkpn2iHEvDM6+tf9VtdIhL/Hm2PGBVnw=; b=nH2yY08vWB5sQ8
	aSAHt63YTNUzqbCE4rkCeGw3WYqa/48SU/hR7O9rz79DNwxeJrHtF71EEJW/1WeNVWgMs8vJOm0xe
	Jf8BobeQ6mXi+Dyd3veoyGYmsUFM8QgMC26seJ4wS9L5QHkqJFD9e9PRFDBvzg3KnRHGynO2RS1KN
	/zUMA5z7HUAq7jqdDZF25804kX/gWhfLL0QCoGl7D0OldSlYtVbvQab7iWTY5gWKsm0SVvYGhDhKj
	VYXLsSoRoQ9dAULYMD+vQemueo67/wncaR0ee+S73ceqvBj9MvLGU4TTlqlewD9YdKKZVxCByD3+V
	Tyb8xefqy1SwbLYpNOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcNp-00000008uzc-4A44;
	Fri, 21 Jun 2024 11:24:45 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcNm-00000008uyN-1tE0;
	Fri, 21 Jun 2024 11:24:43 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-63174692a02so17847857b3.0;
        Fri, 21 Jun 2024 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718969081; x=1719573881; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t+Ed7V/lBbLt1LXAX1sffkPhKR+UYQ+Nb3cW8PobEvQ=;
        b=E1Y95DrY88RGF6EtlRntHkrv+yAm6037emQ1X/HO1B8qj70dE3kE/6tipK+/VvkuZx
         129PouTFr7uveyyAP6i5V6ZdIzAx5nQLAurgUUQlwiO4lpw2r3Tr12lTBCYnk47cvePk
         OWdazcLQl9DI6HkyDERm9xdAVyMoFvuVNwsV4WK2Bw1QIITV8zU0eNvgH9AaP4EqUIqp
         EAq4UTCVUC7764UYhOShnY+q54Ot0SlqncE+cYEes88oYcy/ptcLi9Mr4ITaYNgy4O5f
         m3C3/Zol01BfnAYAHJxRbfcAGUvSypxHyrkXeBjkO7mCdC26M117KDqlPEVMLoUyGYYd
         POYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969081; x=1719573881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+Ed7V/lBbLt1LXAX1sffkPhKR+UYQ+Nb3cW8PobEvQ=;
        b=nJRrCEp+U4vmHr4iYvAwZ0k3hQuooaKiW0ockpCqZ+5tf2MjdQG+f9bZWdDJ72kmNc
         FpiiRUEt7nFDzleINMen3/00c8Nc3O46/va2l60zH+Q6bsnB6V7Kk6rfkO1zqXhl7YcF
         /APRtbEKxwqmMnaKttNvBJLMtjoS36l1alRCwZkIjEDOkqS7MaNhHmEXjdpyssgunAF+
         Bto5lNTXHftjdurc8pzBuHXLaIfuui0XoEc1Eji7n3ziVoMxlHtJWK1s6OIdjYtoTD+0
         fCrCDA0Z48XiSFf/aspuGhEakxirFNFZ+/nKltuPuHLk+EohACADrMXzFoUu3pflRu66
         VqFA==
X-Forwarded-Encrypted: i=1; AJvYcCWk9j0iMDUMtRy09JLETAkRNF9rZdnJ5g/hTsWUoQmGLLMj1R/Ozb5f9aqD8Wn2PipIGf2YoH76zDps3jUrWgB5zg7SNWMtycax9XVICA==
X-Gm-Message-State: AOJu0YzokSItQPpru4a+SxUa/t7E3tn6sovxzj3vWH2qw5t78UxQRcVs
	VfnoeC8IHB49GibhL1sJJHAD6p4kdaQ/ybLhbKleqG/Q1I+Ieh1l
X-Google-Smtp-Source: AGHT+IFPX5v9zDoA3xT2LE2QqgZZjDCjE0pbztbIdSk6bf7jvdY6a3dTixVcvymiJuK7B6Ne3yzMxQ==
X-Received: by 2002:a0d:e2cf:0:b0:61a:e2e4:454d with SMTP id 00721157ae682-63a8fed2d11mr85647597b3.45.1718969081331;
        Fri, 21 Jun 2024 04:24:41 -0700 (PDT)
Received: from andrea (host-82-50-195-19.retail.telecomitalia.it. [82.50.195.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f10d9ef1csm2823757b3.19.2024.06.21.04.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:24:41 -0700 (PDT)
Date: Fri, 21 Jun 2024 13:24:18 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
	David.Laight@aculab.com, ajones@ventanamicro.com
Subject: Re: [RFC v2 0/2] riscv: Idle thread using Zawrs extension
Message-ID: <ZnVi4sGz/xDDigl/@andrea>
References: <20240621093223.37893-1-luxu.kernel@bytedance.com>
 <ZnVhIi0Jre77i3RN@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnVhIi0Jre77i3RN@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_042442_542719_846B1C7A 
X-CRM114-Status: GOOD (  11.20  )
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

On Fri, Jun 21, 2024 at 01:16:50PM +0200, Andrea Parri wrote:
> > This is the second version of idle thread based on Zawrs extension. We
> > rebased our code on Andrew's patch series[1] which provides basic
> > support for Zawrs as well as optimization for spinlock.
> 
> There's some feedback on Andrew's v2 [1] which seems to equally apply
> to the later, mentioned series/submission, and hence to the series in
> question (although only indirectly admittedly).
> 
> As an additional comment, please do add  linux-kernel@vger.kernel.org 
> (the LKML) to your Cc:  list on patch submission (again, this applies
> to both Andrew's and the present submissions).

Ah, yes, and possibly people mentioned in the changelog!  :-)  + Andrew

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
