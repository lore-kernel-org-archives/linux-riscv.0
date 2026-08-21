Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12479C5DF7D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6k8O7BbsDdat7ldQuknycEYZb/IFwZG9GC1Or7ALQ8=; b=Y6ItAfEGOfR6+0
	3bIfXZZAm24We4bcvQteK+jlGciKm+OueZ3ovo1MX5+ImXq6C5e1lBngkq3VyHjtj7vxlZV6kwlGQ
	Un/ORUiyNilLEGGB1AbxEpWeYRWvZg4If46VAhvA44YdKi+sTaCdtWEIf2fY0Oh42YCLo7FWO8vov
	/3303ZP6j4evyzmo2Ff+jvZvmaDvDLmEAc8PKsp9h5/3GrrKgLaZAkOyab6N80lcMDSoVTfZHDLry
	tY3z61P6PD5RjB7h++900ADwcmZvkW7NCQpGxiOzSjAUlyDXUTFVhwykKd9+OefqK1IhehVoQOOu9
	MjWOYV6b/8iE5rjVe7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxGhg-0000000CWPT-1l8r;
	Fri, 21 Aug 2026 04:18:04 +0000
Received: from out-148.mta0.migadu.com ([2001:41d0:1004:224b::94] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxGhd-0000000CWOL-0GnV
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 04:18:02 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Kaob0xBXv6KFmTVwNElHZy6JxuBgW/R+aOKPIun0ZVQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787285877; v=1; x=1787890677;
 b=Aae1+uXbkEO4RVKarSp5WBxgF7s/yh326qXFaSwhq6YwA/dKDUggAY58ObKPAqAbtMtfTTow
 S7JGWO+ZRsoAn7/Q4KB8x1poN901TmzSXM17C8bLd2lN3ZS9K3Bpemwzo4cdD6enr3hPfBc7EKe
 d+mrXbG58lwzDG96EOXnaBEA=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: from localhost (114.94.8.21)
	by smtp.migadu.com with ESMTPS id 782bfd1962df596d;
	Fri, 21 Aug 2026 04:17:56 +0000
X-Mizu-Trace-ID: 782bfd1962df596d
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Fri, 21 Aug 2026 12:17:53 +0800
Message-Id: <DKUBYR4UOS5O.364CXD8TYLPI5@linux.dev>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH 0/6] Add SpacemiT K1 USB2.0 controllers support
From: "Ze Huang" <huang.ze@linux.dev>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Ze Huang"
 <huang.ze@linux.dev>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com> <DKU91NS0JNRS.SLSXQO6JHRLM@linux.dev> <A048E078785BB086+381938ba-e0ab-4764-a5c4-9d2434d0abe3@linux.spacemit.com>
In-Reply-To: <A048E078785BB086+381938ba-e0ab-4764-a5c4-9d2434d0abe3@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_211801_252118_8CF27B8A 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

On Fri Aug 21, 2026 at 11:28 AM CST, Junzhong Pan wrote:
> On 8/21/2026 10:00 AM, Ze Huang wrote:
>> On Wed Aug 12, 2026 at 5:26 PM CST, Junzhong Pan wrote:
>>> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
>>> support, but the hardware has no internal OTG registers, the other is
>>> Host only. These controllers are compatible with Chipidea USB2 driver
>>> with some flags set and reset control support.
>>>
>>> This series is based on 7.2-rc1 and has been tested on Banana Pi F3
>>> development board.
>>>
>>> A self-powered USB device/hub is needed to test the host function of the
>>> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
>>> cellular module e.g.) is needed to test the host only controller.
>>>
>>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> 
>> Tested on OrangePi RV2.
>> 
>> To use USB2.0 Type-A port as host on this board, usb2_0 needs:
>>   - dr_mode = "host"
>>   - a vbus-supply regulator driving gpio126
>> 
>> Tested-by: Ze Huang <huang.ze@linux.dev>
>> 
>
> Thanks, then I'll add rv2 dts node in the next version. Can you
> test again later ?

Sure

>
> Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
