Return-Path: <SRS0=9tbA=M6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A97C5ACCC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 17:42:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50BC20869
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 17:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m6oIAWQf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZRG8Nq1M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B50BC20869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=kCFytj1S+0plSqEwfwZ4dHhLkX4qD7fkFQkyXm/JnSo=; b=m6oIAWQflHpoqy6Wfz+KFANcn
	9zhBViZ28dRBSBIjXyAVaZYj/kKmw0OHNfYc2U/a2G8HWnQvm9RWUTyDqbSOa0y9RUb+kvKlJBfi+
	Gs13yRs5lvr9dSflAlQ5PIOSyrHmFF1Bs7VgZ57gD4fcXzz6HoQflRhK9uTjbeR6HU5uSMoVM5ZNe
	x7acDhyWtYuCsxpodQXR7no9OPOVsWQEyij1LiaG433KZXnkak2YK16eNDZyC66MSsc5VdJ4vZuwa
	p61H9POgzqfHCAFq87Wr7PHimh+qYTH+6IbaO6WpJcMAIxwPlOLBq9nGE/KgwKQbDC9lhv645P7sm
	99nuLsN4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDCJ6-0004Re-A9; Thu, 18 Oct 2018 17:42:00 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDCJ3-0004MC-JD
 for linux-riscv@lists.infradead.org; Thu, 18 Oct 2018 17:41:59 +0000
Received: by mail-pf1-x431.google.com with SMTP id c25-v6so15214937pfe.6
 for <linux-riscv@lists.infradead.org>; Thu, 18 Oct 2018 10:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7VzOgjE6LN8dPXfvFZeQbreJLsUn+hUES7zDgglz9+8=;
 b=ZRG8Nq1M0MLD9ffi5EkYZFlWWGmKe9iu13VfzaDqvonrIW969yOQ8I6UxlquRGgupK
 SuY8t97QxqkMzaRBqL7NOmWiCg0oxF7wENnyAUwic8x+CTSV1dK9Px9stZ0uYV2eiFqU
 yGNZ67ka2dPRhE9EnE4m9ePbeHpKkerilxbZ0djC64ofQYKg+aX1FMrdBwqwJQ6g60zx
 CWsRu22hB+O6RgsORAnGpkZNY+I8kOwW7/+83CdmErmlF1MtJYGCsqMKTX1+z1PX4QO+
 PgC35a8LSkuDRXNrHS5PkvEEf2MTe8XB8PjsVYyN64ZmbvhdyfPHUoEevJfdkJmZuHW8
 g45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7VzOgjE6LN8dPXfvFZeQbreJLsUn+hUES7zDgglz9+8=;
 b=n4adBYO5PKHmAgYO/9b8jsdIBlubQw3tVPMDJQF47tiLLY8exUK/gZilrfxlSsCIjr
 7/l1WGB9t2b67HjE1GkS64UBf/cUpASjtO7kCN9XnFm1vTWnV8/pcnQV/NtJKdVai1yw
 ZEUdcaNd95pTGbFMkyv4tIp0vNxWpazP+ne4T8NM0Z8A3oPzFeLz89QlQG6S3JFdmB/s
 84ENOMYofihM8S8ntCxhmR+yH9cFcEzJOX5PWZp1UFI4BisFgWOrOBWXvavZTmD1pqcv
 4h75Eoez4HcuKc1ofPad7OAq3JKyTJKo6oIgACXu1ZDuNvBpamR8nOrXT/nV3VLbfLyj
 kQPA==
X-Gm-Message-State: ABuFfogwjkvfmpnzcEdTdaR46guIxasJXG9E9i2Nl8ynkpQLiDGwmf0p
 qSZrwiJeeGmoFoPwzJeMKEf23me/0Rc=
X-Google-Smtp-Source: ACcGV629ygYMigM0+9qXCk7x7pL5PKL/z/Um3KfmpRUTGShxmkuHxWwV4gx2T+4LsZ1D5Fz2i9ZJ0w==
X-Received: by 2002:a63:d805:: with SMTP id
 b5-v6mr28863599pgh.174.1539884505594; 
 Thu, 18 Oct 2018 10:41:45 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 84-v6sm35399631pfs.108.2018.10.18.10.41.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Oct 2018 10:41:44 -0700 (PDT)
Date: Thu, 18 Oct 2018 10:41:44 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Oct 2018 10:41:32 PDT (-0700)
Subject: Re: Hifive-U vs 1000baseT
In-Reply-To: <mvmftx3twxq.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-6c9f954e-9436-4d59-b1a2-66bb690db733@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181018_104157_664661_66D86110 
X-CRM114-Status: GOOD (  11.26  )
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
Message-ID: <20181018174144.fVlIBFlanDRVlqFlHuuDp7UYeW79eFRKuS_oftKzG3I@z>

On Thu, 18 Oct 2018 02:40:17 PDT (-0700), schwab@suse.de wrote:
> Are there any known issues with ethernet on the Hifive-U connecting to a
> 1Gb port?  I see that the port gets a link, but no traffic at all.  When
> connecting to a 100Mb port it works fine.

That's weird.  If anything I'd expect it to be the other way around, with 100Mb 
ports not working and 1Gb ports working -- it was that way for a while because 
the link type detection is a bit flaky so we just defaulted to 1Gb.

I just checked all the boards we have out on the lab bench, and assuming I 
managed to follow through the big tangles of wires correctly everything is at 
1Gb.  Some early revisions of the boards had a screwed up trace on some of the 
1Gb lines that mandated a special cable to un-reverse the pairs, but I don't 
think any of those made it out of the lab -- if you send me your serial number 
then I'll double-check.

Have you tried more than one ethernet cable?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
