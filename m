Return-Path: <SRS0=NPVC=TC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C70C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 09:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4E2720652
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 09:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NgHlgM5O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kJ/VcYvH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4E2720652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0QzDE9r8nZL7BYeERNX6Jaj9d9Nqxsioz9ig34lQ2Q=; b=NgHlgM5OI6APsU
	ZSJ28FzzXabvSddhG2j34/UHUtIAukJX6pQBA5t5XtDNFmp42yORtOD0YWbIZphGEwbBlRH2+mE9k
	3rPH1KSneWV5Sy0uThvVcvSdMI/RG0jwv6/tkk0WhvcHY3TosEyvtwi+VFjd2cYZBQQGhNTCwAOVA
	zxwy3v+LD9GgrEaZQd263W7bkdZJ1rcLz0S0SvPuf8+BlDbkFWAtDT+o9mUavA/Xrcs7nsUJ5Xs5d
	Gzy/E8yL2l4+B+ON2YpS64kNso2UYCwo11oKQ+N7DW8RluNQn7YWAGr9xAVIKEUNPAo+Q89p0ZatM
	xmy+yQseL+8BMPm1tz6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM886-0001v9-6I; Thu, 02 May 2019 09:35:50 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM883-0001ub-BR
 for linux-riscv@lists.infradead.org; Thu, 02 May 2019 09:35:48 +0000
Received: by mail-lf1-x141.google.com with SMTP id h18so1346166lfj.11
 for <linux-riscv@lists.infradead.org>; Thu, 02 May 2019 02:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gLiW98ObQ1S6YFlruRE9Fln9ldebb9TO3ZMt7eGSCa4=;
 b=kJ/VcYvHyjnVugkqfWENJv99k8g6t5EVlK98yNTP787dS27OlftIdT80tN/vQeycG1
 OLXK58RYd2gV0AN/zXDeGH/7jYGtSmh27vXpnBU5/WBtDMrT3yNMJrOeykV2L9OnsWaM
 k0q4Ul2eAe/YiFvguNcj0qV85L6744P18qUjYPw4QM17PauwU9dw7t1UKV9G5chzTd3a
 freJak4M0M62x1Vp4lr3/3hdFX7R67+cCzCHre8/Hj7YG2e6jI+b0DyXSqN/6XL4NYjv
 znUwLiR/WoEaDmdfdiNAWx58cuDsNy5tHxIkU/9FYUyI3Ot3Pd20VpxN4qkegjx0tHvh
 Kg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gLiW98ObQ1S6YFlruRE9Fln9ldebb9TO3ZMt7eGSCa4=;
 b=qQ7jErvwg7qzYb+NeAKMccrYs84SYrnhqNvZPq0abeLXfjmRsm9R24uAlvTOqVkYhR
 v/Pm/n19gfBaH3+OPHy0GnCUh0fdBmfJ5hCv8ktYO8UfxvxVr23S26loZq38UTRkQYNW
 pnc1Mv+oPZHCq1Wqg+lWxtfvQ9IRKHNm2g9wy4lg6c7lRjpWUsH+13SmmYhh2yXEfj1z
 R/N8pl861Cw8df+ZRChnb095p11TQbn8S1W3et+U4mE0a1X6h8u9BMn9Q6c73JoKMPp+
 JMrB6aJNP0VGrcfhKFVHISyOzSw6A80cdcPCqlhfpkIkdqkt1htiXoer57OaNeFohpai
 UzvA==
X-Gm-Message-State: APjAAAVcPZl0MdCdfjBzi7+Q0QckbAgLQsI3qf8W7kTh8bdZCbswAPrI
 1tM2I+c6nYPg7H8wHuOsf+JpRHHqlzRiIK4Fbz5zhg==
X-Google-Smtp-Source: APXvYqzbPMzpxD0RPAZhpWdShx/+nGO7oeIUDQ2/rulMH8m6jO3wZL7AozC29zzbdQkX6PEqZ8Xr/tJPlZ0x7ozzxpU=
X-Received: by 2002:ac2:48a5:: with SMTP id u5mr1414737lfg.115.1556789745312; 
 Thu, 02 May 2019 02:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-2-git-send-email-yash.shah@sifive.com>
 <20190425101318.GA8469@e107155-lin>
 <CAJ2_jOEBqBnorz9PcQp72Jjju9RX_P8mU=Gq+0xCCcWsBiJksw@mail.gmail.com>
 <20190426093358.GA28309@e107155-lin>
 <CAJ2_jOEoD=Njp+L+H=jG59mA-j9SnwzyNmz7ECogWmbvei_f5Q@mail.gmail.com>
 <20190502004130.GA20802@bogus>
 <CAJ2_jOETZa_oC-xSwfQVw-9Q6OivRG2R0rKMhwCk1knbxWJQVw@mail.gmail.com>
 <20190502091044.GD12498@e107155-lin>
In-Reply-To: <20190502091044.GD12498@e107155-lin>
From: Yash Shah <yash.shah@sifive.com>
Date: Thu, 2 May 2019 15:05:08 +0530
Message-ID: <CAJ2_jOG7a=gnxWiZ+mDW6KH9cWZC1HO7ZuwCiXBQJuNJJ1NBHA@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
To: Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_023547_397546_E51F9663 
X-CRM114-Status: UNSURE (   6.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Rob Herring <robh@kernel.org>, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 2, 2019 at 2:40 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> Sorry if I created confusion. I just wanted a note saying all the properties
> in ePAPR/DeviceTree specification applies for this platform. That would
> help me check if the standard cacheinfo infrastruction works as is or not.

Sure, will add this note.

- Yash
>
> --
> Regards,
> Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
