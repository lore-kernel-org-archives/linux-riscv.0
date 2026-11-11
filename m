Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF3606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 01:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NyPukr9d;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SQVTUtzl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Da91kjg4BUcD2YplejwWMJCyqqdY9CMDdYCZi9T0GE4=; b=NyPukr9ddHeG8YEXyWJS3DY6K2
	QuUJpGEHUxaDm5nIEbpp6L3f1/UgfvwYUX5obpJ9IwWM2IJHX3ud+vhnerwNCIMnPVojFJlV3Cjgv
	4vRgADHbSn9lKIOjiNwhJy8O92hUGnbzyFJurTbMM0o2by2ByV83CTsMbspo4orO5BdkI9rcfJh2+
	37oGfuBggRVij9wdk7pzlz3kTtvEjER+buSPGSm8Cxp4BAAyhF59o8KDUPcDzjbfVyP6LSi6ibLfX
	T2ySf8BbctqSG6YOP16bLLfPG4akRLWSx3Vuiui/Z+dXLj2tFrsb5BRazVDuXJFRY8sstJRK7bzlJ
	eG9gpRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwtb-00000005M8K-1x6Q;
	Wed, 11 Nov 2026 01:13:03 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwtT-00000005M5L-19vD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 01:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794359530;
	bh=a3XFBWaVL7cZAtmzMb6ZHGk2os0RkwoM4AiUI/2FEuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SQVTUtzlwsnquVcK6R0EQ9PTx/fI3wlh/wLCvI9Up2N9IbzQhR2mOjtV7XKCZ+mh3
	 WQv/dRI9x+PAyX4Az6YxTF922HrLZOitXB8E8qH8HA9cnLYd56g59T0czGjpLIxPaA
	 /SrXKUxKP1N1p3UduGwCzyCWG1gqZDtIilDXL9Ek=
X-QQ-mid: zesmtpsz5t1794359529t41b4978e
X-QQ-Originating-IP: ygy4xZLnMdBFlasO8HXKH6PUKGIStAkWKnImD4xzJkY=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Nov 2026 09:12:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11734215651587251840
Message-ID: <47902FCAC1DDFAB2+525255ac-cc05-4a57-bd83-a4a29edcbe01@linux.spacemit.com>
Date: Wed, 11 Nov 2026 09:12:03 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
To: Aurelien Jarno <aurelien@aurel32.net>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Andy Chiu <tchiu@tenstorrent.com>, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <apSYF5x1Tu7PlyL1@aurel32.net> <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net> <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
 <arSshYwcyHjC2dh3@aurel32.net> <arS-yYLK8Df5knSE@gmail.com>
 <arX7PwOnlz0N9rUc@aurel32.net> <arnt6EEacEm3YRIC@aurel32.net>
 <db540b00-a017-4c82-9a6c-93e862dcde67@iscas.ac.cn>
 <ato_lUcnuZV30Mtj@aurel32.net> <auulITfR8BrabdVF@aurel32.net>
Content-Language: en-US
From: kevin zhang <zhangmeng.kevin@linux.spacemit.com>
In-Reply-To: <auulITfR8BrabdVF@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ngwq0BL9nhqbAtXnitlNnAmS9CIO/2HplAL2O4yC+9hXQYCOFk+2jON6
	zw11CVwY3NUzGpSuWIkrJMEtABGWEUmTem0URCW18ZGefedUO5MgC3zIJwpcbkVCMEwvk5t
	IcDNlUdIOeyUJPtj1KQOyb0HQwFkf4TBY8L2d6Vy7gbJm18TzimhZLUapxH3AomgsqFhCqB
	yIcCNmTPPzARQ+liit/9DzeA2NkSRDVC9rfjms148ZVXuR2iH5dJMoVZx8mEPRCpr+u0lBn
	oKPTES3LEA5wUjp7k8Sr4br0r3G5ByiLN0Wm2cOOmJOX6MeXO8M9ce1os3GW9a0O8uj9Rmo
	vWoQ6ot22wnx20DB2PeuyJphH6Ok+YwskIDJ5a201RQanrG5N92zF/bcZf1PVdi1813+azA
	28US6gWXy/3IGl3bbsSvoBtgzoOvmBo0yWgTIE6+3hI5iXaw/XtDROd/bFxfzJfriFBw6N7
	gmfvgp7yG912sqbb0hc3Hm33i4uRDKc4t8KxGyPipW2RGOGTCvH0eEwKnDcM3CX4d6o1gxZ
	2Fbtb6SLfhmmSH+msUkct6I8lp2diXodffSWnDeYz5d0cpy2stUjAvaeFqPZ/FN62F2E6gx
	ykRxo0Uz5U2NJqUoKYTknaN0/Bj793ULVDqR4dgakcSoluvS/EkbKEx35gsCbNdb8up8ikY
	l5ehrIEs+E/9BGhYFFeAeRmqcRq4fmndq/Lbq7oU+xTaNQF458CFbZFpQ1kxIznzTqAPmbI
	uxEaKvD1+2WEQcRZby8IKiR8nA8++uT8A2u0CfllKO2LTAf4uWIA5qREJGnLXXbbls2ySv8
	kdha5FUGPhK0Bu26SacisUoWJZYCooZzYGG7YyJi4HoPNgbj7twDdMN/G+fdDP5Rj91u+DA
	sv/sVwjXLADvNdovwgTv9gjbgDLOdKLPhjopB6t8kyj/Z/G6fCafuFoVKgpWHUcpTSU8p2T
	scsyLlzVedpPHA81o9DaWHNEJ57LWhCP+59G+R/eXtVW5C/TSwNir3hMa9QYsQYIADgr8iD
	8opONhK7k6TOuAKXBkCPsOBgA1lQEtmTgPk2Z10ag9/Znay3ME
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_171256_217096_FA9E551D 
X-CRM114-Status: GOOD (  25.32  )
X-Spam-Score: 0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Aurelien,

Thank you for your continued efforts.

On 11/5/2026 5:35 AM, Aurelien Jarno wrote:
> Hi,
> 
> I have finally been able to capture the last few exceptions happening
> for one event where the vectored user copy code is corrupting data. That
> was on the SpacemiT K1.
> 
> I added a hook to handle_exception(), activated only when
> __asm_vector_usercopy_sum_enabled is running, and recording CPU state at
> the beginning of the exception, in per-CPU 16-entry tables.
> On the OpenSBI side, I also instrumented sbi_trap_handler() to log the
> CAUSE_MISALIGNED_LOAD and CAUSE_LOAD_ACCESS cases. This only fires
> during the kernel boot when it tries to measure speed of unaligned
> accesses.
> 
> The case I captured was a 4096-byte long copy, from 0x2a883310
> (userland) to 0xffffffd701e54000 (kernel), presumably from a write
> syscall. The copy is considered successful, i.e it exits with a0=0. That
> said after the copy, the source and the destination start to differ
> after the first 16 bytes, at address 0xffffffd701e54010.
> 
> The copy started on CPU 5 and ended on CPU 5, and there was only a
> single exception between the start and the end, so it wasn't
> rescheduled.
> 
> The exception happened with epc=0xffffffff80e09204, which corresponds to
> the location of the "vle8.v v0,(a1)" instruction. I recorded:
> - cause=0xd
> - badaddr=0x2a883410
> - a0=0xffffffd701e54100
> - a1=0x2a883410
> - a2=0xf00
> - vl=0x100
> - vstart=0x0
> - vtype=0xc3
> 
> As you can see, the exception happened during the second iteration of
> the loop. It is not clear to me why the first iteration didn't trigger a
> page fault, as both 0x2a883310 and 0x2a883410 are on the same 4k page. I
> have also logged the content of v0 at the time of the exception, and I
> can clearly see that only the first 16 bytes (out of 32 bytes) got
> loaded during the previous iteration. Its content matches the error
> reported by GNU as on the userland side.
 From the information you provided, the issue does indeed seem quite 
strange. Could you please share your debug patch with me? I'll try to 
further locate and analyze the issue on my side.
> 
> Then the remaining of the loop continued without exception to copy 4096
> bytes in total.
> 
> At this stage, I do not have any other explanation than a CPU bug. That
> said, I have noticed that the problem started when userland started to
> use the vector extension, and with the above, I do not have any
> explanation for the link between the two. I'll try to capture another
> corruption event (it takes ages) to see if it can help refine the
> explanation.
> 
> Regards
> Aurelien
> 
Best Regards,
kevin.z.m



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
