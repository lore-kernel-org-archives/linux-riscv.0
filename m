Return-Path: <SRS0=snlg=QC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFA7C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 26 Jan 2019 01:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BB4218FF
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 26 Jan 2019 01:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="beL5fdBZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZRYmQQCV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00BB4218FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qpe7rj1ZQEts5SZUv9m9E6NGbmoo1MAmXvUsyOmf5Rs=; b=beL5fdBZ9o8CQf
	ux2TTXKlLtRqJWWOi45R9g2quT105z5VawmyoObDr3K6FCLi7aZWSDw4kjfgYBF6+tPDT6ovrf5Ri
	FtEbgAGCJVzic7FaHWvg5fpnXIZhWdU8R7dPlTI+lppl0vnHlbSK0SKaB9N3KiBZwrmjzpmfR1CLR
	WqyFB09Ed6qRQqzxsvGmvXSmCT/jwCdDbxtWjOGNMFrEHbHSoftTBqKMVCPmK3BakLmWI4LNNioVh
	4GO/jH+/Tcxx6+Y+TGZ9iMjim65LIRCHRjjCNs7zdoCge6d+voQ/sdLivQZPANp9UWmhSxBjyj2Qa
	XfIJj6NyMW5cxjOQ3PbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnCrG-0006PK-2A; Sat, 26 Jan 2019 01:34:06 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnCrD-0006P0-Nb
 for linux-riscv@lists.infradead.org; Sat, 26 Jan 2019 01:34:05 +0000
Received: by mail-vs1-xe42.google.com with SMTP id z3so6796292vsf.7
 for <linux-riscv@lists.infradead.org>; Fri, 25 Jan 2019 17:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XJrZXkYyrN9rzSG4wQtsHpb/eXlEkzOIdVGMJ6B9mPU=;
 b=ZRYmQQCVeave2I3tOS7Fu/0yzVjEBZ3lUBypJ9/Jvd54CMQUOfKVfxL992VEBMMFzk
 fBWdn1pv7KV1LT6v7XKbDMNkF/4YmgjdzsOLsGClfCW0sfG9X4ziopy34pULxCGfDoz5
 HQiE51w5MiGebwxPr8ORl/sX5hoyv7NsLZHZQr12q4ZFc0LejdKKbHyCTLD8E3yGCPWG
 /b0eZHrVLCTKCgpxXQyvQUT5uPU/T+LnbSTdBOAp9+dpx9wFZUHG+2+VVM4zD12Wa8b/
 kZwkO+NwwQo7QZxcb85tnfQZgskxwb9fhnGxhIu+EvtYJh1s+W5KDzUOaTzx5Otdg9qp
 Uqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJrZXkYyrN9rzSG4wQtsHpb/eXlEkzOIdVGMJ6B9mPU=;
 b=Kx+M2nzCdrPChDMnbO0mNxZDwt0HCKJ1s1EA2BWjn1Bj/9E/DM0mRw67pclf+Sj7Vt
 fK3Ye6vDkPQfgAV4+QEgz0vP0anlQy9oWvmq7UIN+tWUXFK7yWhgo5lRoeQC46kp5roO
 RtKLqcedT/30WEjLM+O3aGV7slaYXqGfs+YPHECHxzQDrmtemjQQ5SSzDb883C6pwl3U
 bmVdmr2zk6um/viiCLPfowDsEuqNtoeEGimVMgNwnz8edE8MJmXFCtMIwWFqc3BK7i8T
 QvuxjKHT6PHQY44x/6IZAnO/WL9NVYYgMN2nI1jbcSpgkD/fw7HH4C27eXwwVt0GLp6d
 AZkg==
X-Gm-Message-State: AJcUukfrwdpxPLGRhDwP0jmECd5oCF5od1v+/IOnPw9YQ2piso1cOnSh
 sHrIk69siVY4nHMAMD5mquodOGNCMxNXqwumbDS7qQ==
X-Google-Smtp-Source: ALg8bN56SbUSJ38A2zYkHS1xPIITNjUF8+/dotHOk2AiWap7c5PkFJMAYnuWcRf3lwhsgz62LFk536g6BOwX+Gc2wmI=
X-Received: by 2002:a67:e0d4:: with SMTP id m20mr5636672vsl.182.1548466441470; 
 Fri, 25 Jan 2019 17:34:01 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+HfNigethi_fK-Cv5CskH9B7b+9Go1_qSVsGhvXnX1kbxykw@mail.gmail.com>
 <mhng-0770bfe6-73bd-4b8a-9fa7-142ed95a6974@palmer-si-x1c4>
In-Reply-To: <mhng-0770bfe6-73bd-4b8a-9fa7-142ed95a6974@palmer-si-x1c4>
From: Jim Wilson <jimw@sifive.com>
Date: Fri, 25 Jan 2019 17:33:50 -0800
Message-ID: <CAFyWVaaAg9TuNVPbNmP0ongf6y2hmqFMiXJZHo8K84O4-BV0yw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] riscv: set HAVE_EFFICIENT_UNALIGNED_ACCESS
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_173403_796634_F4FAEFDA 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: David Lee <davidlee@sifive.com>, daniel@iogearbox.net,
 bjorn.topel@gmail.com, Christoph Hellwig <hch@infradead.org>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 25, 2019 at 12:21 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> Jim, would you be opposed to something like this?

This looks OK to me.

>     +    builtin_define_with_int_value ("__riscv_tune_misaligned_load_cost",
>     +                                   riscv_tune_info->slow_unaligned_access ? 1024 : 1);
>     +    builtin_define_with_int_value ("__riscv_tune_misaligned_store_cost",
>     +                                   riscv_tune_info->slow_unaligned_access ? 1024 : 1);

It would be nice to have a better way to compute these values, maybe
an extra field in the tune structure, but we can always worry about
that later when we need it.

Jim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
