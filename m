Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52858C32772
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 18:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjGh2DbI2TOHyXDKZ5zKFSm6GyoC2kQuXuEwpdIt40s=; b=Zxg3KQEpZ4bINK
	97k1BxTdd9nv+jY5H4VJzcAzwR21XbvCKHbROL1tpgLwz7HP4ZROqsnmTov3AUpVMtByQHfSAIMty
	ohmfk/VU3BIpmn9+taT8KSQkijHwEzTqRYvvvkQLS7aabelQJMMC1VVkK8CiZfnOfhQdhCBbuav1C
	sZiB/hN0PegmXVyuLZwo3b6kcp1Ql2F0xcM2CjBE5E0E8gbTJPpXUeSzL1WQaQnGNXiQ7eK1709Xa
	TS8reh9so1FvsBAiJlziEuCy+AWgj7eiGPFWh/T3bucP3605gt5kvUOdU4oLYAknZXU3T7mMXtv8b
	3tfTlDwPY/3HFy634McA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYtH-008AmP-LC; Tue, 23 Aug 2022 18:44:43 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYtE-008Adg-OX
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 18:44:41 +0000
Received: by mail-ej1-x62a.google.com with SMTP id sd33so7853813ejc.8
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 11:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mE2uuXhnOCBfGRFD8JVhu3ERDiR2gzRpdMBo3mVwdjk=;
        b=WzE808DGu7i8pZFIArBxO4Tcwgvc3CjL12AdpUErOlEsYrPBsOelwu3Behq3OpNBeH
         QULAAG9N0lmCFQqnoUJO4RMru8zuIMYBc6XNtA9Bdebd0aV5cqG4BN5gaQlsik5WByMr
         ZCJ5W1m7l1/yA3/c608F8ft4kdfdyLUaqGo9qWfSBIbhK6ZnU4aajGTD8xwOzQYAal7t
         5y9tXUwbjzxRelhmWLyp7Qh0L1BH4btVYhV6Bvl/C8WhvE2+2EpZzbAsGuUMwg+SlK7q
         RIsaefSNRqrzXW2Li7rcYQgSXBNJDgLsQEzHbOXDEmgsCNPqfR3S516MHQj4gNWy3HYr
         +1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mE2uuXhnOCBfGRFD8JVhu3ERDiR2gzRpdMBo3mVwdjk=;
        b=rHLRB7IcQ1/RGQfPDS8GUW7F8N1vR9u2Dz18Zg7mGZKir2p4Zhz1ymlOdtIPuWhLAT
         pzmxOQB7WpD59rhFp9RrN3snC3VN0gq6Nn09Hut7fQU2IBxGmAxqEyIURXTbDD75TC3q
         zi5d0fQUX5DVY2/5qFClu3cNgQ8/PQ4QRpVUiR/UIFy03akcFa17BiAsoaVLuT/WHlym
         eFlXXEJZU9ch+7aAsJTRUWnxCC7FKgWec6oFFJ0k8PxnqMvWqL9MW5qhzT0mxEWmT7iF
         bjwQFudrBzu2lII4IHzrdtatvCG71hlnomOxqrCytA6J8PKupOmdGtQcWcCZUWIhAYbI
         ih7g==
X-Gm-Message-State: ACgBeo2hhk03rU2kFSke6Nt3O68E7UYgjwLlbgXuvZr7TZg0GES7AnDu
	MgPyM64GB32m9I+ER9om/tYMCBW9zcF2SZnHPlk=
X-Google-Smtp-Source: AA6agR5UfBMiSR7RVL5LukrusoA9jAvxTmaYlIOyJgm0SSnvHF5qEfG2WcVOWsn9ovD5pd8CXBBQRghwa4nR0pJdGgM=
X-Received: by 2002:a17:906:6a10:b0:73d:939a:ec93 with SMTP id
 qw16-20020a1709066a1000b0073d939aec93mr605014ejc.112.1661280275602; Tue, 23
 Aug 2022 11:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220805125618.733628-1-conor.dooley@microchip.com> <814208de-e3e4-852b-766d-14889a6c3c91@microchip.com>
In-Reply-To: <814208de-e3e4-852b-766d-14889a6c3c91@microchip.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 23 Aug 2022 13:44:24 -0500
Message-ID: <CABb+yY1DtHmknUPTzp6OiZsFL5zgwptSREfwzzX9d3EW46V0Yg@mail.gmail.com>
Subject: Re: [PATCH 0/3] MPFS mailbox fixes
To: Conor.Dooley@microchip.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	Daire.McNamara@microchip.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_114440_812311_BAFEE864 
X-CRM114-Status: GOOD (  15.13  )
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

On Tue, Aug 23, 2022 at 1:42 PM <Conor.Dooley@microchip.com> wrote:
>
> On 05/08/2022 13:56, Conor Dooley wrote:
> > Hey all,
> >
> > I spotted a couple of bugs in my mailbox driver while developing some
> > new features. None of the features these bugs relate to were in use so
> > they've gone unnoticed until now. The binding screwup is unfortunate
> > and I don't really know how I misread the register map so badly.
> >
> > Jassi:
> > Not sure if you prefer developers to add a CC: stable or not to patches
> > so I have left them out, but I would like to see them backported.
>
> Hey Jassi,
> Have you just not had a chance to look at this yet, or are you waiting
> for me to resend with the extra fixes tag applied?
>
Please resend with fixes tags.

thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
