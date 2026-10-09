Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEF7CA5FED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 07:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O85FiFs6qRoTeB6xztMhIixH1rRYsFv1nPlXrt7YnoI=; b=pBEjL5gxiMWDOa
	s7d0aIpCJxkQ7rISODmcSxM72whxBa4Dfn4KPvrXvvlr6wAWZ5j3dBTy65yufW5pufF2/iYOWoABD
	OPNQb24b6ub641XN7XrSiLjeTuVCT+TosBwKZ5AJFq5S53kV7hjoAUskc/2k9zuWwNVwrl7nTp/w3
	1NniY7CWKp7vJZNRwzhzkndMF/RY+IJWadnH5jvPvRSHP8jHKcfHox1xnRSyO+taTGjS74H6MMOy7
	KEMOs+AM+WuRbyq26gmken6o7q4Z5AiqEj1SPTnsAwBkaJijiJbirGJimgV7FxmApwLDQblTXgLsI
	m1mO/gpbi/Ad/fcRjokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4qk-00000005hiV-3l3U;
	Fri, 09 Oct 2026 07:17:03 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4qg-00000005hhn-34Mz
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 07:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791530177;
	bh=5Sbve23T2nM2tzDYXLYF+bZA1hmEj/GkRMM29V+yUkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RmRSh7ekPOFjWlX2RINgtOeSmKPPwK9OAZHKDZFB4MbrvVH4YltgdrSHbnrh/OAqO
	 aeyaallJqYEfEfnz95LyVrHUQE1VMTG8dKTj2jSrG56vPLzxvUPSDLkdZtFGefg1zw
	 FJKlm4Do6gl1pgwmscVgiAAa5itJcPqIseJH8V98=
X-QQ-mid: esmtpgz13t1791530168t2d291361
X-QQ-Originating-IP: khSeAFlHEEgU33IJubM1BqqYTdCyduUbyBl99wc8zk4=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:16:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10654036301431491844
Message-ID: <FDA9F931EC8B8D5F+e3ce2a41-637e-45a6-b46e-6bfdeab5076e@linux.spacemit.com>
Date: Fri, 9 Oct 2026 15:16:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
 Ze Huang <huang.ze@linux.dev>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
 <20260927-b4-spacemit-k1-usb2-v3-1-ce7095896039@linux.spacemit.com>
 <bcd2df4f-9ff6-4d30-8735-573d661bf367@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <bcd2df4f-9ff6-4d30-8735-573d661bf367@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OYpbVsTx4C81x+0HRdbi89wx4qhoAHOO6w97HrJHdmkcROTTICuY/N1O
	wnhDoZ6+v17TZDsWNxB2pEDDzCDrjRw5N3LOXYTT3suUUs/iqOKrUYx5pglp31vEuWXYvd1
	Qhg/WesjiwUClvMGcA87CXmXQDNmLlCivz+jE1C1JCzeudZMBMJLXkvDbKZR6Ang0IfTxPk
	G2VGI63Cc7lcM893men3ifDrpEDjBolpMMnM00v02WGLZeTuJtgWWTEczTwQ8Y5Drx3Z22L
	wYM/tl6rSz4PeyVgRJ6mKq3TP7gluMYL+AxcNcbqwiEYC8gPvjOsnh69hyxyiTxDT3gE5hG
	gVLaRPhZMbByotyk+ZIH2tbAUsvO00lQnXNMWDf2OTCu/9qxuUazpcVimLIu0PK0bGM/quX
	IdiRaHQ6NkAqUn3A8vYWxxZfA+HP0qjwrzCm4zz2aQXkv3xZCcfSi6+bXX6Ti/NZX3k0p6j
	NVZl99EWuwTX7/0f0sz4UrJWPw5g9l/JM44Qa8Qj3Tibl3/ZrKPaMvV7swp59u/fGJEVQpr
	zRW2j3dJzxX1/z0+zu/mkE0JblTy/ggJhNYj4bga4xv75ALyxk4hwAL9CSKYYrcKZss6VaW
	jzjxAzpiHUBT5j02ER0iExyJughcW5clbtfeF8lsfYJZI0YjzROs8NaygK6KJPK2iiqWpoM
	1H6OTMNdM1OlABfrowAdxeZdIctMNHelbR/CeIf88rMnzF094S6wDMaNY7oJWhL9JBzW/Jo
	dKqRIgJg3pnF6edn8GFSQDlSaasoI06Qfnzs9xc35nMh4vRvo/aMzmCsYlVFeC0Gve+xCFm
	42YU+umniKPV8myBKKtIu2QFgUOaq38PeKHD8XKpxfJMeN+ef5EFAhZD4AGEW3XHmlkYHvd
	cSp+w8gRhF6ld9kRJKs/VW8cGLXZsI2Eu7rU2/3k7XCZym3B7vIv8uBX0gh8UCsyYajoDFv
	G2h+DGtTxttnxujWj3wcR+IeK0wJM/BdB8EkkAIP9/MdL1S6bYBcVFZzsjugHnkN+e+P6YF
	CTFL8BfrB1YBVekhZD/3uA8F0DJvci8TeDi/rmMYzsk7lhaQ1F
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_001659_481559_D24617FF 
X-CRM114-Status: GOOD (  10.73  )
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



On 10/6/2026 11:09 PM, Krzysztof Kozlowski wrote:
> On 27/09/2026 13:40, Junzhong Pan wrote:
>> The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
>> has no internal OTG registers, this requires flags which disable
>> related features set in platform data. Add a compatible string to match
>> the platform data.
>>
>> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
>> work, add constraints for it.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Tested-by: Ze Huang <huang.ze@linux.dev>
> 
> This is a fake test, you cannot test bindings how we understand Linux
> kernel testing. Please drop such blanket-fake test tags from all patches
> where this is not relevant.
> 

Okay, I used b4 before and I thought it should be collected in whole series.

I will drop irrelevant ones, only keep those in patches truely tested by Ze's
setup and send v4.

Thanks!
> 
> Best regards,
> Krzysztof
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
