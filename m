Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62474C433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 09:50:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4F4360FE9
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 09:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4F4360FE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iwobgaSHOlqWm83mli7zwbKi9QlNCdHt107bZ6bjC8g=; b=EhorOyhz6kwZ146IIZxNjVGge
	wfkQfTs+ZZRL5+15F6NroCgKpw0uKi91qnDcalZv4busqMINO0UhAn3L7eDsDwokuJHJQbVr3BQmV
	k04X3xDQlL38Ns1addBNimq9Cqmy6nB3ZMrzNP3fg7QRqBR/LPqpYDbooHnzcwB/+x/MUdw31ENBi
	iaI97T2K9AEBS1KDRS1jKSQbIk0kgX5D6YGIcACqajrSmdT/ihYHRrpG7PcTp3f4oeeNBVAbhQiNc
	9B3zVCRhFa1PWetUTmd3xE5ERLpeIa62WcnzKO22rclsf6jWNqxOlZajU2PKPPYSt7B6ctExzhyAp
	3Fgc27wEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldVDT-00Da9D-EV; Mon, 03 May 2021 09:50:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldVCR-00Da4l-Ve
 for linux-riscv@desiato.infradead.org; Mon, 03 May 2021 09:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MxJLb+ygPOSc1s4jkTCr3WpnkstsUG9OT+AgF9yJyJM=; b=DfDbwP8WV6rcM/KI72dR4b38oq
 BID//fQ9mpoHIkq0RcIWjvuw1CBeOP6I1498cWvcP9S1TLQ4G5vFfINkPk9kzfdRDJYn8tLyb3c/a
 TGRfOOMevM/+MMGWwtQaBmt3pGQgttzyilZEdw3sw21cpoLM+HhdzubBXbeDI6uFCKZlK9CmOA5YQ
 FmoqEsMygh3xLJ6R3L5Qsk3RNb8oR1dUh6h7LS5RWlz0TqszXfDf6ytow7Z1bN3eAXOD6xAREynxE
 fi300+CcjhZ25YYiZHxTKo0GADbebeBdWsCA/e6RbLBZ4hmEAmgmsAvTIN58h6nJiq8Ls6yUUyunY
 3bMCy8Dw==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldVCP-002xJy-DI
 for linux-riscv@lists.infradead.org; Mon, 03 May 2021 09:49:10 +0000
Received: by mail-lf1-x12c.google.com with SMTP id c3so3152758lfs.7
 for <linux-riscv@lists.infradead.org>; Mon, 03 May 2021 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MxJLb+ygPOSc1s4jkTCr3WpnkstsUG9OT+AgF9yJyJM=;
 b=L2Okofnh+nI4KG9D4jS3dPq7uMy7zX3MoaDNsLku2rv1p+JCuCycrUhGQh3bN4jLao
 Z2Tb+ZyHD6Z33j6r11oEs60V4DQX4UEaRNtVuh+dfkUofHMt34GzzhFIaiZxkBhTGXOK
 WolPbOJhWmGB3mhsuTtxXCtcXSXJ2Uz6A88uJD5/ANWNgGeSAKZOHFIAJ+AMqoqWg81l
 WsU5TSq3ktxz/R0cjDVvz47BrNsgljf96EO59UaOhnnunTQ0vRpmMHQeHkEmFeNTAJYn
 ut8PZdGMT+DOEEpC2A8g0Cg21jj7+3AWVikbjJtQgqXCEzDx/TPEs1Eb14TG1oOUEBV1
 sp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MxJLb+ygPOSc1s4jkTCr3WpnkstsUG9OT+AgF9yJyJM=;
 b=eF5BGO50Xdmu5/HqPh5EMbq5NRpfrl1UKzx/KEfG6zIhjjRrj20lAHZrCkMMr1PDgd
 oPZZY3gQ+dgHgesKlGRYcSk7leyWInkFwW9tANpxXbgA+nCks3jLnuwX0mXWvvZu6lhW
 +Gep3J0C+lZwehi/9s6heJ3bwc2VrY4yjOFO8Q33QYwSMzCAP2pgT10Vf2A9Dzp30QyF
 OP5+60rxeMGYhpPH1l96MRw2Go3dOJxYkY2McrBejxPrXsVmaeE4XCpjTbUkfzg/uQfh
 VAeKPtFCplzETXP3UkPLIKhfNDA3R7y5QD4nIrpccVFnmeaOLLbEUNUBd4YegS22KKkb
 gXDA==
X-Gm-Message-State: AOAM530aosPX/Vs9eCcUivkTrCYBrrTbRKP9XQOXVlMua0/bmSjzKZFr
 hud8WybMW7kNLFYEvEGpUzqbcQ==
X-Google-Smtp-Source: ABdhPJzhF/j+aryEsz1w0KLEzdyFZwzZ6xWzP9d/ftzoOA567IhOefWHg93LARjh8yYYNHONoC3+UQ==
X-Received: by 2002:ac2:532d:: with SMTP id f13mr5151750lfh.81.1620035337449; 
 Mon, 03 May 2021 02:48:57 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id n27sm1093460lfh.271.2021.05.03.02.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 02:48:56 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id D372F1025F5; Mon,  3 May 2021 12:49:00 +0300 (+03)
Date: Mon, 3 May 2021 12:49:00 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210503094900.idmjc4zbrxr5sn73@box.shutemov.name>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_024909_472341_F3326DD7 
X-CRM114-Status: GOOD (  10.82  )
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

On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> Last year, Arnd and Kirill (maybe others were involved too) made a
> list of distros and older gcc versions. But I don't think anybody
> actually _maintains_ such a list.

Distrowatch does. I used it for checking. But you need to check it per
distro. For Debian it would be here:

https://distrowatch.com/table.php?distribution=debian

-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
