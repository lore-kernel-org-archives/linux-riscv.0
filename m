Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB0AD1358E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 00:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sc137HQqnIhbOU6epPNoCYsmYn5upKakDo5BhL3LdQI=; b=v/J3wThBx4yR+D31SBtvh65yww
	ReAJVmUB2J5pc0PF26/5B8jCdgHrLBWKyIIx4fRC3rLHDaJG8M4EH1q7/KeD95j3Mpy7ORjne6GWs
	z60ekn4H1zEUXBCyVjEG3DwOgnPpp6AMPvm2e/4Xwm0FR5c53A0TAqd7snFKe7mI0Tgn/XOAzTqAl
	/6xxcq7C+tQNJecKsoljpdR8HjImwf2wibAxDyhcYrtTdopNw0/K8uFeLaHEsUQgmQO4vwvpTmEbC
	RLfwpgTE3Q417nTGhp7lfgkRdR0miFxGS1hnkyUJF6OLKGlaDVrqWS3yn2B8aYsoiL/k1xhMA3UkA
	mmeeChhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5DSP-000000097sz-45CJ;
	Mon, 28 Oct 2024 00:18:05 +0000
Received: from omta038.useast.a.cloudfilter.net ([44.202.169.37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5DSM-000000097rD-0Z4R
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 00:18:04 +0000
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id 568LtVTcbg2lz5DS9tFEqY; Mon, 28 Oct 2024 00:17:49 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 5DS7toGbI2Zy05DS7tSM3U; Mon, 28 Oct 2024 00:17:47 +0000
X-Authority-Analysis: v=2.4 cv=Q4EZ4J2a c=1 sm=1 tr=0 ts=671ed82b
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=7vwVE5O1G3EA:10
 a=uxgLTjTjiylkul1d-vUA:9 a=QEXdDO2ut3YA:10 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ct8wg4kLyMMfEQg5mOMY7RKn2GG8vdZ2NnPY3zDs58Y=; b=g2pnPtktSDLV7w0LvEuyzXDOVa
	Hk56yvw2tiUIcOwVf1i2Gg2/DertkMuZ9Hj+WBBB4Nu+ezmi65YX7i4Ji1vmdaI5Fwo1uLg0IpbbY
	j5Iwk/ENesWiyHO3kCdjf6kNbIuDHbYtou/3CzzwvhT4DQkwkJA4+e3vw1EAXF9dTFKDK4S/YdSKq
	PEgTs//zKwdL748SqmzOkuvYBoTOCq3bItaYke1E3SKdqiE4a0k2LKjxSHOpTR9iwAXJsysH6Zw+1
	nx2m6PkOEfNip1R7pQivJ4VAphdM0ftW42M2VLaryR4ty1AkYujn22ku0yWMbhkHmHLauXeW+In7T
	9F5JPkxQ==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:35924 helo=[10.0.1.47])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1t5DS6-001d97-0a;
	Sun, 27 Oct 2024 18:17:46 -0600
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
To: Thomas Gleixner <tglx@linutronix.de>,
 Celeste Liu <coelacanthushex@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>,
 Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <87ldya4nv0.ffs@tglx>
 <3dc10d89-6c0c-4654-95ed-dd6f19efbad4@gmail.com> <87a5ep4k0n.ffs@tglx>
 <2b1a96b1-dbc5-40ed-b1b6-2c82d3df9eb2@gmail.com> <877c9t43jw.ffs@tglx>
From: Ron Economos <re@w6rz.net>
Message-ID: <81afb4bf-084b-e061-8ce4-90b76da16256@w6rz.net>
Date: Sun, 27 Oct 2024 17:17:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <877c9t43jw.ffs@tglx>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1t5DS6-001d97-0a
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.47]) [73.223.253.157]:35924
X-Source-Auth: re@w6rz.net
X-Email-Count: 20
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBgJshssA3GodFmsPgbnoTsueuegIh0NbAffd1eFEIF4u9/tDpwHBzYGvnroBij5ROw8UieszxpsPxxlQZMimiKDdNLWDjaCLCTpKfdKoZ/1s2CAgkDM
 w48oCNw+no5b8pUq8JVccdQmXXevY7Oo0zSCfxq85ePKybKjReUJWgB3Uj6zVfoyr7tKeZ/+INhUbeeVenShU4PfvQ/BbGC3qrU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_171802_421460_1B584890 
X-CRM114-Status: UNSURE (   8.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/27/24 2:52 PM, Thomas Gleixner wrote:
> On Mon, Oct 28 2024 at 01:01, Celeste Liu wrote:
>> On 2024-10-27 23:56, Thomas Gleixner wrote:
>>> Equivalently you need to be able to modify orig_a0 for changing arg0,
>>> no?
>> Ok.
>>
>> Greg, could you accept a backport a new API parameter for
>> PTRACE_GETREGSET/PTRACE_SETREGSET to 4.19 LTS branch?
> Fix the problem properly and put a proper Fixes tag on it and worry
> about the backport later.
>
> Thanks,
>
>          tglx
>
I wouldn't worry about backporting to the 4.19 kernel. It's essentially 
prehistoric for RISC-V. There's no device tree support for any hardware. 
Also, 4.19 will be going EOL very soon (December 2024).

Ron


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
