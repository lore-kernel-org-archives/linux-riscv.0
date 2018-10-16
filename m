Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93375C04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 00:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AFBF20866
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 00:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="avNCyeYh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Z5dqSqks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AFBF20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5zYE603GDWkxYeXq9H7cINI7zQ3vYDo7JtCIc+6ZynI=; b=avNCyeYhwIhyxHXkGH65a5/Up
	0MZFriwEYl3TLOahjnjzJfaoiUjN5Za1OhfXMVg2HVIWKTofrUhWGs08x7zN40DgduV6UkWHwOzO5
	d3HNNWw7v80Yg7m8L+YL7OPlgHyL/4TJAi3FwL2a0OA3dPF+l26LacVOW9BHsr9wy/441QdwgYlGR
	DpQr2MvigzJcxwuse7USrKYEzUV8kEpdMREkQFG63ysTGdRmoVyB8Ru33I03thjnFU6tFb8UDBXnj
	ESNizy7P/P3RK0GSc+qKi6RPytrfjUUUycvWM7O51uCznR3ina6HrPyRuzGpJLtidmdZglxA/CHtE
	N9oXZt0nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCDPP-0000aP-Ra; Tue, 16 Oct 2018 00:40:27 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCDPN-0000ZP-MK
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 00:40:27 +0000
Received: by mail-pg1-x529.google.com with SMTP id c10-v6so9959210pgq.4
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 17:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtvwgpWy9o3sJB2FUo30o6ltX+QcOHTTA0avHX/3IYQ=;
 b=Z5dqSqksAjPUury7bMYLlorWrNw2EU9//3DCCRv5gZcvEwCIuG0qN1V0TzM95S9ain
 XYnTqDuH6Rm6mkKMGBux52xYKbfAn58OJo7ck6T05DVYcBhPk/pAgHgRD0RqMvHUsv+o
 9cbUh0wtFW6a49ciMNEEBsq7K7cRct6tDrzG+/QCYE5XpmQgUlBgLsQw7ZZqiAbODvSm
 5TozZcKrrp8/Mtre/sN74Y/H2Uwu/5Z1nMoVf3mjjxVco2YV4LxqhXPvm8Zv9fh1+6aa
 l6ShKSBHiv7Vkwh5Yly8dzOfZTj3EA36VDzpoQAIq5hv1xd7DgHvb7puUi6PyZFIJIED
 d5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZtvwgpWy9o3sJB2FUo30o6ltX+QcOHTTA0avHX/3IYQ=;
 b=JfWT+eUen5Q9iHTouoQFMMHANJSfWVZxV7pvd83vxUuapFLL9BraJoCaiW02kb/Go3
 I1kpJ+BvsoT0ykzu9ycqExhY6elBhbta3azRzUkAMwVmicy2AteA8gjGW5Iz4qt092kz
 3gTOxLbY7mClGqmPKZT9O93fn5FvvSta4LGQ4rpmh1jZqwInnoW81P1rfuPt+1qoAjNf
 4j9ro0azLNOCZlPawACzGCCohf9gqLlfU6O9ggy+IPi47UVC4aDESl+oBtw3tKwbz5Ja
 9wOnEdglQ/FkO7ZdoLV1HKA2fYz5SDntS1UQEn7bgSkrkejpi0+Zp4U6p0BxE75K2qdQ
 6XJg==
X-Gm-Message-State: ABuFfoj/vkD67J0Wg+jF2v9V5KrCwh1XP1Dtuog6wvZI52Tkb7lNDs7a
 B/S4A55ri1TvxUhN1119lPDsxQ==
X-Google-Smtp-Source: ACcGV63Z7wdAgQj6VFpNlRVLKv/aI+k9OcuaCCe44hXndshGYgHpWJvPjI31yXdp38Yvnc8Fh4WtHQ==
X-Received: by 2002:a63:d60a:: with SMTP id
 q10-v6mr17863122pgg.175.1539650414738; 
 Mon, 15 Oct 2018 17:40:14 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a16-v6sm14506763pfi.49.2018.10.15.17.40.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Oct 2018 17:40:13 -0700 (PDT)
Date: Mon, 15 Oct 2018 17:40:13 -0700 (PDT)
X-Google-Original-Date: Mon, 15 Oct 2018 17:40:09 PDT (-0700)
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for vda
 device
In-Reply-To: <20181015211451.GC31130@redhat.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: rjones@redhat.com
Message-ID: <mhng-2be13863-3f80-432c-9945-2770e7e7e4b4@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_174025_760115_00C03734 
X-CRM114-Status: GOOD (  19.03  )
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
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org,
 pintu.ping@gmail.com, Michael Clark <michaeljclark@mac.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016004013.LOgaL5xylnrsGL1bdDCZ5eJIRQhse9XdHFYmrd5Edd4@z>

On Mon, 15 Oct 2018 14:14:51 PDT (-0700), rjones@redhat.com wrote:
> On Tue, Oct 16, 2018 at 09:26:20AM +1300, 'Michael Clark' via RISC-V SW Dev wrote:
>> Dropping isa-dev, adding sw-dev
>>
>> > On 16/10/2018, at 3:00 AM, Pintu Kumar <pintu.ping@gmail.com> wrote:
>> >
>> > Hi,
>> > I am trying to setup riscv-qemu booting on a new Ubuntu PC.
>> > I dont want to use freedom-u-sdk, so I am preparing my own environment.
>> > I could able to build the following:
>> > - riscv-toolchain
>> > - riscv-linux
>> > - riscv-qemu
>> > - riscv-pk
>> > - busybear
>> >
>> > After that, I am trying to boot riscv-qemu, using the following command:
>> > # sudo qemu-system-riscv64 -nographic -machine virt -kernel
>> > PK/riscv-pk/build/bbl -append "root=/dev/vda ro console=ttyS0" -drive
>> > file=busybear.bin,format=raw,id=hd0 -device
>> > virtio-blk-device,drive=hd0
>>
>> Note: sudo is not required. sudo is used in the busybear start-qemu.sh script as it uses bridged networking. The latest version of busybear points at linux-4.19-rc5 so the issue may have been fixed.
>>
>> > But, I am getting kernel panic.
>> >
>> > ---------
>> > bbl loader
>> > ....
>> > Linux version 4.18.0-rc6...
>
> It's a bit of a guess, but could this be the upstream kernel?  The
> latest riscv-linux is 4.18.0 (not -rc6).
>
> The reason I say it might be the upstream kernel is because ...
>
>> > virtio_blk: probe of virtio0 failed with error -22
>
> ... I saw this exact error when I was using the upstream kernel
> instead of the one which supported interrupt handling.  Interrupt
> handling for RISC-V was added upstream after 4.18 so wouldn't be
> included in upstream 4.18.0-rc6.

Your best bet today is to run 4.19-rc8, which should be pretty stable.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
