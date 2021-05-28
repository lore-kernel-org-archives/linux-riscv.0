Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82683C47087
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 11:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 484DC61378
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 11:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 484DC61378
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxAbZOAhzlxXXfiiIiaX2xbnj/uKhsHLSSnOrN1OX/I=; b=Wp/aHLdttd0nQN
	hl8EHtTDRgLVliT0xmb4ylrGCaxEUC4fknPuqaCHR3wxLUJAtjACJ8mLvthQur4P4bIgokYBfSldM
	KeB0D3N3OwWJTW9w0ZD+vV81uuMVjy+kwyFXJZdJ9fO4HmFpp228OSoq+CWAO+X0DKLwvA45RZyS9
	IxRS0faKpDqbRIJEZ3qCYydZ9GrjdhdpxvPx40dTkZf5zxwEXuKgg9PK3TNgLZw1e+lf2zaX/J2HF
	/OjZqgu2yYmCzbmEjWIhYerT38QCQNJWm46Tgyoc+cHaaL/dbBOs8ogZuKDr4WtQGS/6k4aXRcNWo
	oZoYmZSJVfDjucRID9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmaiI-00EsdO-K2; Fri, 28 May 2021 11:31:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmaDF-00Ecy5-Gy
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 10:59:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B1A8611C9;
 Fri, 28 May 2021 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622199572;
 bh=zzTg//JWRJmLbfsss1mAwtKialHZLfBAuqwpAk0bH2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sISctQYe71xc4YAHUZoc9Q0ZSjTHmE8Hv5TCw/xM8GeZtdAYy0f0FnNCtv/RauuIa
 022KFhfFD6lz4dtDw6W1xQs31H2iHPAAZZ26Z3k41BL710ckRtcUI5fNhfvZSbqbPp
 JD3m51YBPbmY6GyyQOGOEmUvxcR1BQjRIt6ArCwk=
Date: Fri, 28 May 2021 12:59:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: arch/riscv/staging
Message-ID: <YLDNEbm+M/geZkHG@kroah.com>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
 <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
 <YLCvdmwPrm/S/GKg@kroah.com>
 <CH2PR04MB70782F16D88C700AB621D1B6E7229@CH2PR04MB7078.namprd04.prod.outlook.com>
 <YLC211VUeTrUdo3v@kroah.com>
 <efa8b40b-4c64-4323-7070-223329a52872@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efa8b40b-4c64-4323-7070-223329a52872@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_035933_663345_2E420E32 
X-CRM114-Status: GOOD (  11.72  )
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

On Fri, May 28, 2021 at 11:37:02AM +0200, Paolo Bonzini wrote:
> On 28/05/21 11:24, Greg Kroah-Hartman wrote:
> > Ok, as it sounds like this isn't going anywhere until the spec group
> > gets their work done, you all should just wait as there's no real need
> > for any kernel code here either, given that there can't be any hardware
> > made until the spec is finished anyway.
> 
> There's need for kernel code so that userspace tooling can be built upon it.
> Not having the header files in Linus's tree makes it harder to merge RISC-V
> KVM support in userspace.  KVM shields userspace from any future changes to
> the hypervisor specification; the userspace API *is* based exclusively on
> ratified specifications and there's no risk of breaking the ABI.

The "risk" is the kernel/hardware api, that seems to not be solid yet
given the spec is not released so I understand why the riscv maintainers
do not want to accept it.

Work to make that solid/released and then no one will be complaining
here,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
