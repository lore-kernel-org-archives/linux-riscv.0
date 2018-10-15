Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E640C04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 17:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F074020881
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 17:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3Z/pdM/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MQ7CCpoT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F074020881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=aOwPHhzQ8Ivn5p/B3yGlpyZU9Qa8387DE2ZufXnK2gA=; b=b3Z/pdM/g9I0eb/6bparCCqoz
	FYOoiUXu5JkwQYpIh20UZb6jXJ7ZKzYx/ovL0++2vkBs5TnQAJ1ceaX2ao4DP22XQigJPrGS/aEHf
	zm3k0i+Eo4F9xJGhk3XjlUxrByYvuV07JCwGNTyLF9x15InLcpCSoF/ymSM5ROUJOj1icpTiMh9bS
	KdD52z96brOZVFp975VwkOhyIA9Kg2YOaPUTmAbiFPtZpuQgZtMVbumGWGkrhY7KI8jyccEAynOrf
	Q7vH1COTCRSHGKOS7IIFMKNl4AcdIC6D358ID31kk+C885ZDG1MdyB3j2PESj06yJjVlT6kgnzZO5
	BhAPU/r4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC6qv-000283-SX; Mon, 15 Oct 2018 17:40:25 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC6qG-0000lu-JB
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 17:39:46 +0000
Received: by mail-pl1-x641.google.com with SMTP id 1-v6so9644648plv.7
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=u4qqrI5jy2Nsx6vqJMErCXV+x9CzWtkXUfLAHHyh21s=;
 b=MQ7CCpoTVctWJTJhZAoLydQrq/d8IQGpt0H6UERYdfb1Cwffb1vDPdCW2Gkfqa88Kg
 j2Ll07oLBAALUbDelc2ibLyz7wXbI9sVJQB6cAi32BVVzBpRShP2VKKZkjgBqREvuNTX
 Ad2G137Ya0v8HJ76l3yVHCjGjJ1TzIHI0rR7La/0TgdoMiFK5GzaP44xoesLfovy+W/f
 fwIkXKPi1P7qASnIA1NZ52Gim/eHlKh7UqiNoLmFFzoPN1HYtjvTQ6YeCMH3kzQGhCzf
 fGXLMPg023jq6ACak68LsMyP9ClMB4Iy+qM46puc7lg+75JBqGUbsheXj1HLIxKKn3W6
 WvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=u4qqrI5jy2Nsx6vqJMErCXV+x9CzWtkXUfLAHHyh21s=;
 b=QWgA7DqVE+9E3YOKa38TUjhFDbJJ9WFfO/v1g2dRrIyzMdxiUV5Gdnjnf1mGV/e9uZ
 M30MW869XDlBYUBAp0ytmbbyC3TrjTe0kG3my/xmnK+TWK4rQSFTqPxAoozh8AwL98Vv
 CCJNnONmJsNU2JrfyTZuEncmgQY1uUjSbK+8qfoceyIgrq7WA7bUzEQHTmulvvb+9Fws
 wVwEwGxE5i3eU6PjIOpEE6hdFVItSLHY30HWXlm99dLXXgDHfetjQWh5v25LAufELgpq
 yKAihRULYhSSMwY6p/g+2buvfklFZ1tMxOT6NTjmcgRKvyPxPoxEnroBjH2hnvBj0kc3
 zAJw==
X-Gm-Message-State: ABuFfog1RlJrqa10qPoE0oy6pEsVckhQthO0BJBwIAjS4q05AhFuDiJr
 SmVQQfNZYxJhX0I4Du5p+uNHPw==
X-Google-Smtp-Source: ACcGV60yRmG72YY1S7+8mvD3ZovWgtM99ZNjvMAc5wontyhUxLXC68qdWGf04P9/gTVOhWh9BTIFTQ==
X-Received: by 2002:a17:902:9a94:: with SMTP id
 w20-v6mr5797372plp.115.1539625170835; 
 Mon, 15 Oct 2018 10:39:30 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a16-v6sm13793080pfi.49.2018.10.15.10.39.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Oct 2018 10:39:29 -0700 (PDT)
Date: Mon, 15 Oct 2018 10:39:29 -0700 (PDT)
X-Google-Original-Date: Mon, 15 Oct 2018 10:39:01 PDT (-0700)
Subject: Re: [PATCH 5/5] RISC-V: Implement sparsemem
In-Reply-To: <15C8B877-4BBE-47E1-98D1-945E9355E757@raithlin.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: sbates@raithlin.com
Message-ID: <mhng-d8f1905a-8985-4797-b05b-b165b4ce91f1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_103944_635028_DDDD6A9A 
X-CRM114-Status: GOOD (  16.50  )
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
Cc: robh@kernel.org, aou@eecs.berkeley.edu, Andrew Waterman <andrew@sifive.com>,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Clark <michaeljclark@mac.com>, zong@andestech.com, linux-mm@kvack.org,
 Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 logang@deltatee.com, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015173929.stUpIuKc8DweP0RPtuVREG9VNcAOrznKUSVjKWTfjFA@z>

On Thu, 11 Oct 2018 05:18:20 PDT (-0700), sbates@raithlin.com wrote:
> Palmer
> 
>> I don't really know anything about this, but you're welcome to add a
>>    
>>    Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> 
> Thanks. I think it would be good to get someone who's familiar with linux/mm to take a look.
>     
>> if you think it'll help.  I'm assuming you're targeting a different tree for 
>> the patch set, in which case it's probably best to keep this together with the 
>> rest of it.
> 
> No I think this series should be pulled by the RISC-V maintainer. The other patches in this series just refactor some code and need to be ACK'ed by their ARCH developers but I suspect the series should be pulled into RISC-V. That said since it does touch other arch should it be pulled by mm? 
> 
> BTW note that RISC-V SPARSEMEM support is pretty useful for all manner of things and not just the p2pdma discussed in the cover.

Ah, OK -- I thought this was adding the support everywhere.  Do you mind 
re-sending the patches with the various acks/reviews and I'll put in on 
for-next?

>     
>> Thanks for porting your stuff to RISC-V!
> 
> You bet ;-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
