Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F01C43461
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 20:39:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4491D20C09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 20:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JtHMeToJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="PLZPiLkU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4491D20C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+0BKhAjduOuWKZS+AR2WwSxKD3gfE048aUKbyt15x4I=; b=JtHMeToJhj+UR7GsYTlgzoobC
	BrNPAvkwGl/a33YUplGcLzj0BmXePl9e+hLhAdtoqFfKI6I9mxxpX+pYuQ9wfbf1oCVcBQd/xp13v
	WdesiJj7be63nFJ8WDKxA5G2IupR3E7JkcyjHfk8FGCq/q2kIgbJwj/rXr94ssW2+IUcScUvRbNKt
	K7ErM+8oegEi+Ip1nSO0uE/EWhQKTk17zc5XIqWsd/pccPWGK9HEpX8r22N0Wj4libBIJ825F1zVj
	gHTmAchzXVPQNOjd06QdzSMSYKhkrkkNIU+x5f/A6TOanmHG92NpO9O0zhFzjjmv+ua8Gyb6jFl/A
	2bx+WU1oQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG6rv-000639-Mx; Wed, 09 Sep 2020 20:39:03 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG6rt-00062f-8S
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 20:39:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id b124so3170825pfg.13
 for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2020 13:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pvTELsnuqawB+9CsCnyO4FXHa5jqvr6EqiJIinGYuyw=;
 b=PLZPiLkU77f9XNFW8QrusL13z1a4SsShUnxQOOKJxFwPNbQngptnHWjyTnlNrh07Z1
 SuqvnFhCNi6xZ/LkCG84M89gi4WieZbxofhpHM7yRfQII/7rVu80rUgab7G/+IlPoz0J
 JoSyqkqgDva2xC4i2QaBP1cVEasVCAG3wQZconV7kVDWiV4jdOGAVWH9vRqle8i/wmO1
 EYlHBTpm25ht0q8HDx8RZZYKF0kBclWfL0cElzSE4wFlHLJcqYpxXsNrhLKVIoOyDk8m
 RlrCE4sT1WGbMYlovipYVFkhBxIAkVxwB1y5mBogm1g+gjJ1RAsV+LUr0FmpAA6OME5m
 D+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pvTELsnuqawB+9CsCnyO4FXHa5jqvr6EqiJIinGYuyw=;
 b=Wpgua68EmptD5BnMBMmUNIkO8I19ONcTqo8Ssf0EevJlNpY/mn3ykRGc7lmoTCh4ZH
 Y94eOMWbkJRrmp+UYVuC0wipdyEVdzXPp32GwDntBwKdlcyqyVl9tJwkRfek7Kwodei6
 4KiIXo6+grycml3PxDvuSH3O1nMb3zLpA3UP8bWfFq8/Vyw/05WJMEXqsLRxQg8Lqo+a
 +7mP00GRbs+Ybn4NhRuqWvTNsJJ2VN7B/Ok+SQkWnU0We6iCgVqp+wxym5YOuLjBEL9Y
 dnnrA0xYva/IS+5EgngGzwvqhvOiioYkGxAwPzGim2m+frBzPv9XIsdAdK1vktMh+gva
 m9CQ==
X-Gm-Message-State: AOAM531SP9GDlbNmkE8sNeqc59V+rA6ENUJtigiifXQtCSX7WUV8xvOc
 BxaRVFp3GnT8LghfUC1H1pzA/Q==
X-Google-Smtp-Source: ABdhPJzrC5l7v5FTB1r/YYtUR1nC0/3uzkDrW1qiPAnWCKJr6AMnKAG1nnvmAvNG0lAHQfGXBcYCqQ==
X-Received: by 2002:a62:ce4b:0:b029:13e:d13d:a100 with SMTP id
 y72-20020a62ce4b0000b029013ed13da100mr2268407pfg.28.1599683938493; 
 Wed, 09 Sep 2020 13:38:58 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z23sm3514558pfg.220.2020.09.09.13.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 13:38:57 -0700 (PDT)
Date: Wed, 09 Sep 2020 13:38:57 -0700 (PDT)
X-Google-Original-Date: Wed, 09 Sep 2020 13:38:04 PDT (-0700)
Subject: Re: remove set_fs for riscv v2
In-Reply-To: <20200909065515.GA9618@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-e33e9c39-7441-44f4-9c77-2243bb81168b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_163901_308914_D92445AE 
X-CRM114-Status: GOOD (  19.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Sep 2020 23:55:15 PDT (-0700), Christoph Hellwig wrote:
> On Tue, Sep 08, 2020 at 09:59:29PM -0700, Palmer Dabbelt wrote:
>>>
>>> The first four patches are general improvements and enablement for all nommu
>>> ports, and might make sense to merge through the above base branch.
>>
>> Seems like it to me.  These won't work without the SET_FS code so I'm OK if you
>> guys want to keep them all together.  Otherwise I think I'd need to wait until
>> the SET_FS stuff gets merged before taking any of these, which would be a bit
>> of a headache.
>
> now that we've sorted out a remaining issue base.set_fs should not
> be rebased any more, so you could pull it into the riscv tree or a topic
> branch.
>
> The first four patch should go into base.set_fs, though.  Arnd, can you
> re-review the updated patches?

OK, assuming the first four land through vfs I'll take the rest through my
tree.  I wasn't sure it was OK to merge another subtree into my tree, as IIRC I
got told not to do something like that before, but I'll go figure out a sane
way to handle it.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
