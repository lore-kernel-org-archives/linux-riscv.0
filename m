Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67D6ECDE3A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:01:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6624620835
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gPQIaPBc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ELx7h2ig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6624620835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0pfdbM5ible/chjKVjyOHOUq7zYRa2IuwS24YA9MrHU=; b=gPQIaPBcMuETvkqKboHKavOeR
	CDHsuDKT5gOLMB+7o4fQsp2AowzPkhpjPUfs5AqmAi4P34wRchdbg6vwIZC9lpWIOiuJKMPUExLiZ
	v5eqHFAuAvoXJ25XzUdyF5dC9A94ofs6AOW4oucsNWnRWEd/FaE6IUEdZn4SzsvFFotCiFtR0N4n/
	IyhC6f45moZquAwIRWQzrUNYyb38ssXeDncWYKB2Hz9Dqoo6NyflrlQpd2Hau0B//nqVmmoJOD0nh
	FRDD4F/1mhDtSBkzRu5Mnql8XufHh827/aXGWRj/xuEsKCac1R8j0VjuAIzQeapP+uP7n4CJwTJ3Y
	W7UZ3PGdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9wJj-000663-49; Tue, 09 Oct 2018 18:01:11 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9vz5-0003F6-MZ
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 17:40:56 +0000
Received: by mail-pl1-x643.google.com with SMTP id s4-v6so1188641plp.0
 for <linux-riscv@lists.infradead.org>; Tue, 09 Oct 2018 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YJbVbLMGXurKTYglgUAUcIE2/pFzIh+yi5ripnvYdA4=;
 b=ELx7h2ig2/8tmLmcibDzXXXlAQ1/nfFumKoNKc+ScblFfDIRNeLFmUgYZ61mPL9nEy
 7O/0VruMeMFMgSFggOO/mUov4EGzh2H1/db6go3C/5sTfqO+iwNueVeWL8PyepXV140Z
 +hkghlukxFFbqAjxZ8fPeRG1EW2nDi2lY+pHx4gxGdYGv3+zGMPmpjjzY5uISw+rIE0a
 ughP+NOmaNJydGMi5Ta57Tguy8bOIaE1dx4fK9N5T5tlTj7BFbSWv1D+5ZJDFxydqpDp
 itirLuZG+cGkXhPjL3v8K7wVETR564DWniTSOGwVzdJ9Yd5DTtTOQxqeKo/COUkXJ4Cq
 Sxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YJbVbLMGXurKTYglgUAUcIE2/pFzIh+yi5ripnvYdA4=;
 b=i2C87Yfu5m4Td4kYP5+YlRx0XMswcM00NZPxxLGe5d3EAK7SaJ/mWycSoZIENJ3lEH
 CUzXhftM2IgRZvMYR2Ay6J73GeB2wUld6ItZMivuEbdaMEUoqJYJhyI8ZJnV42j+EMR6
 yv2ym7eMe7tfXr0B/9hvspvMNOFVkrhNDyXHJvcaNixxPHcY8fYrq9p4Bi1/Ad4Z2JJq
 BkNTqOd/0KDO1GAky6uOzN9t734RQo/7qcsakS8ioRN98Nd/zWKLAYcT3xlYWLtF/fYT
 o9kG98Vt39uGtKZpzeZXhxuxIfa+pYXiuCxIU5uTEx0lqbGrl+6a3E7PlakvzR0GGLRn
 oXyA==
X-Gm-Message-State: ABuFfogMOvpAtw5UVO+j87a46caamV1bmQEOGyX+I05WfFwjCgQD6RSq
 h3j7p5C3MHLyEfiVCkPKluABQTBvVjE=
X-Google-Smtp-Source: ACcGV62VgJKWbKBFWa79WoNCFFFn63FWXvWLKAtPmKNG9mGW3SnZ76ta4AAp1CPUi1lTMnwPFfg3Ng==
X-Received: by 2002:a17:902:369:: with SMTP id
 96-v6mr24494928pld.36.1539106779692; 
 Tue, 09 Oct 2018 10:39:39 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c2-v6sm16973505pfn.95.2018.10.09.10.39.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Oct 2018 10:39:38 -0700 (PDT)
Date: Tue, 09 Oct 2018 10:39:38 -0700 (PDT)
X-Google-Original-Date: Tue, 09 Oct 2018 10:39:16 PDT (-0700)
Subject: Re: [PATCH] RISC-V: remove the unused return_to_handler export
In-Reply-To: <20181009161533.GA21260@lst.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-976e0e6f-930c-4e03-9a28-0bd9f80d3266@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181009_103951_785968_664843BA 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009173938.D2bAzVQVPD6nI4NscY4-D1iiQKIl67F09ncyHfRMd90@z>

Sorry, this must have gotten lost.  It'll be in for-next soon.

On Tue, 09 Oct 2018 09:15:33 PDT (-0700), Christoph Hellwig wrote:
> ping?
>
> On Fri, Sep 21, 2018 at 08:43:21AM +0200, Christoph Hellwig wrote:
>> This export is not only not needed, but also breaks symbol versioning
>> due to being an undeclared assembly export.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  arch/riscv/kernel/mcount.S | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
>> index 5721624886a1..8a5593ff9ff3 100644
>> --- a/arch/riscv/kernel/mcount.S
>> +++ b/arch/riscv/kernel/mcount.S
>> @@ -75,7 +75,6 @@ ENTRY(return_to_handler)
>>  	RESTORE_RET_ABI_STATE
>>  	jalr	a1
>>  ENDPROC(return_to_handler)
>> -EXPORT_SYMBOL(return_to_handler)
>>  #endif
>>
>>  #ifndef CONFIG_DYNAMIC_FTRACE
>> --
>> 2.18.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> ---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
