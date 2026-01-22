Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371BCC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmnUWg/IUEgCb0e8wib1Z7XWDg3HSgHRXk+1uO1EOFo=; b=J1HyPWvh7sT9Lf
	BELEIueGt+6jnPc8DluIwqgcqtC+UzokTpCWoUWmscVSyW24uESZsPtUbvRoOuktEwipYqRN5S8H+
	685LEZ8BnpnZOOpsKgu3eHoPTgKSp3NhQYnaltn3ejRSLQjQKOcWYYQM9hXzALHWyDEgCXDgW3LPd
	tu4Qv3/OtfcPF6HvRF+FmuqlXJivHcKTxDo29e+4RZP7j9LgzVUOCvLP+q9llgjMZLFIClaPgk9VU
	ZTG8pSYQ+pvhrdNLJ8eB8+x5onjmfYOWHxEI1C+Fhu5eUFL99Pb8k3TugVrZnFagPLIYrQ+RP9SW5
	wTXDLZFaMX1ll92e/NzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit3l-00000006zGj-1jWJ;
	Thu, 22 Jan 2026 11:41:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit3j-00000006zGX-2I0l
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Jan 2026 11:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kG2AIxIWH9YRnqrSVj4qktDyQAM1oSw/ZIFoeBq6s78=; b=Wh6NtdHIlNNabM7Jzy7QEn84jo
	9bgQB1iVc83jVL66Qc/Xscyt86cgHO0ia81R9PjQA12lHw83rzZ6xdxQzgLjtA2aXN0zbX10zmwwY
	Gj3YTQwXQnJCkIBc3DNbNKv5xgf0TBsXvpZqcLd6a2X6JjyvSkX9OGFLILKV6L4UW8f3XYQGFwssW
	+kLQzovhMpR2+BKP5dtV6MMcLTX+OlZFtHcqk+U4ALVHPfHlmeEpRuzUc7r6YwhWV32eKV+/VSVv3
	aN8cO112eMDA3aulEiDwQH/1BkGduNH+5i2A50hBD505VZOgr8a2SCsVe3yraIUt2tIghwtM5p1IM
	3z2XJ+TQ==;
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit3f-00000000GJK-0egj
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 11:41:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769082054; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pb8wiJACOCATzEXc4PgWeHIX19E6c8dIl0diDlAgtpiB0IAwUMTZURj9rCubMT0CuzRWrb2BPGCqmrhgshV3wU+jAIfwilYbnYY9NjhFMNLLPXHi7Y3s3tB6cKDIy29ifBkwYWuvZYwnOj6XXaOZ8nTabaya4N+xCJCDWSHzxhE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769082054; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kG2AIxIWH9YRnqrSVj4qktDyQAM1oSw/ZIFoeBq6s78=; 
	b=Dj4aFJGUyrUKNT48CUlGd3wNqeM8ZFloOsQ90iuc4DIUrjrzDt3EV1ltEGMvJIRegNKk5apzWRMdelYfKACU5hIxhjUeJR/sOdGlyx9s/HrvvsSpZjuQnHabxf5u7eJfd7RUBbFQQRV6fUboqX1EqgRgu1UNWnS7Fvi/xTYbvbk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769082054;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=kG2AIxIWH9YRnqrSVj4qktDyQAM1oSw/ZIFoeBq6s78=;
	b=BqgP/0+kjtY5+I2wZdBhES5UOLW9z1ic0VLtrQkGNlJ7QWvS9+jpKGeGORrH+7kB
	eUHuZ79RxGH2zG0JY1ZMWSVqESzpwtdokYeP8JXMY0tzcC7Vjz2zjwiS8D66YXfaarc
	/srXBXlWqzXyCep56oIBWOFMZ32N71mASZEWajLE=
Received: by mx.zohomail.com with SMTPS id 176908204557861.379657628005475;
	Thu, 22 Jan 2026 03:40:45 -0800 (PST)
Message-ID: <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
Date: Thu, 22 Jan 2026 19:40:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] clk: canaan: Add clock driver for Canaan K230
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
 <aW3o8xVziqb9iRBN@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aW3o8xVziqb9iRBN@duge-virtual-machine>
Feedback-ID: rr080112278a99ca22fe3413b8502573b80000d112c6c8de0269d35716262045f3868d8834dff19452d12e59:zu080112270525b0f9423d0c1823811a910000b1028f03cb95fe0534d1fd2bc67e39b74b00cfd63973a25f42:rf0801122c843053e5f5fb5ac981c0487f000022c182bfb45a1df9df852c4ef67ed102773d21a27587345871b15b159e36:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_114103_749208_6EAF1D72 
X-CRM114-Status: GOOD (  11.37  )
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


On 2026/1/19 16:18, Jiayu Du wrote:
>> +
>> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
>> +		     K230_HS_HCLK_SRC_GATE,
>> +		     0x18, 0, 0, 0,
>> +		     &hs_hclk_high_src_rate.clk.hw);
> Here, you replaced hs_hclk_high_gate(in v9) with hs_hclk_high_src_rate,

I'm a bit confused, as I don't recall making these specific changes.
Looking at the code below, the only difference between v9 and v10 is
within the K230_CLK_GATE_FORMAT(hs_hclk_src_gate, ...) definition, where
the second parameter changed from 1 to 0. Everything else appears
consistent. Could you clarify which change you were referring to?

The code

in v8:

+K230_CLK_RATE_FORMAT(hs_hclk_high_src_rate, +
K230_HS_HCLK_HIGH_SRC_RATE, + 1, 1, 0, 0, + 1, 8, 0, 0x7, + 0x1C, 31,
div, 0x0, + false, 0, + &pll0_div4.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_high_gate, + K230_HS_HCLK_HIGH_GATE, +
0x18, 1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_src_gate, + K230_HS_HCLK_SRC_GATE, + 0x18,
1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_RATE_FORMAT(hs_hclk_src_rate, + K230_HS_HCLK_SRC_RATE, + 1, 1,
0, 0, + 1, 8, 3, 0x7, + 0x1C, 31, div, 0x0, + false, 0, +
&hs_hclk_src_gate.clk.hw);

in v9:

+K230_CLK_RATE_FORMAT(hs_hclk_high_src_rate, +
K230_HS_HCLK_HIGH_SRC_RATE, + 1, 1, 0, 0, + 1, 8, 0, 0x7, + 0x1C, 31,
div, 0x0, + false, 0, + &pll0_div4.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_high_gate, + K230_HS_HCLK_HIGH_GATE, +
0x18, 1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_src_gate, + K230_HS_HCLK_SRC_GATE, + 0x18,
1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_RATE_FORMAT(hs_hclk_src_rate, + K230_HS_HCLK_SRC_RATE, + 1, 1,
0, 0, + 1, 8, 3, 0x7, + 0x1C, 31, div, 0x0, + false, 0, +
&hs_hclk_src_gate.clk.hw); +

in v10:

+K230_CLK_RATE_FORMAT(hs_hclk_high_src_rate, +
K230_HS_HCLK_HIGH_SRC_RATE, + 1, 1, 0, 0, + 1, 8, 0, 0x7, + 0x1C, 31,
div, 0x0, + false, 0, + &pll0_div4.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_high_gate, + K230_HS_HCLK_HIGH_GATE, +
0x18, 1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_src_gate, + K230_HS_HCLK_SRC_GATE, + 0x18,
0, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_RATE_FORMAT(hs_hclk_src_rate, + K230_HS_HCLK_SRC_RATE, + 1, 1,
0, 0, + 1, 8, 3, 0x7, + 0x1C, 31, div, 0x0, + false, 0, +
&hs_hclk_src_gate.clk.hw);

> but after my board test, I find that when hs_hclk_high_gate is turned
> off, the mmc/sd and other high-speed subsystems can not work. So maybe
> you should not change the hs_hclk_high_gate to hs_hclk_high_src_rate.

Regarding the clock management, I recommend explicitly enabling
hs_hclk_high_gateas it will be closed by `close unused clocks`.

>
> When I used clk_ignore_unused, I saw the log as follows, while the enable
> and prepare count of hs_hclk_high_gate is zero. Here is the log:
>        pll0_div4                     5  5  0  400000000   0   0     50000      Y  deviceless   no_connection_id
>           hs_hclk_high_src_rate      1  1  0  400000000   0   0     50000      Y     deviceless   no_connection_id
>              hs_hclk_high_gate       0  0  0  400000000   0   0     50000      Y        deviceless   no_connection_id
>              hs_hclk_src_gate        1  1  0  400000000   0   0     50000      Y        deviceless   no_connection_id
>                 hs_hclk_src_rate     4  4  0  200000000   0   0     50000      Y           deviceless   no_connection_id
>                    hs_sd0_ahb_gate   1  1  0  200000000   0   0     50000      Y              91580000.mmc   ahb
>                                                                                             deviceless   no_connection_id
>                    hs_sd1_ahb_gate   1  1  0  200000000   0   0     50000      Y              91581000.mmc   ahb
>                                                                                             deviceless   no_connection_id
>                    hs_ssi1_ahb_gate  0  0  0  200000000   0   0     50000      Y              deviceless   no_connection_id
>                    hs_ssi2_ahb_gate  0  0  0  200000000   0   0     50000      Y              deviceless   no_connection_id
>                    hs_usb0_ahb_gate  1  1  0  200000000   0   0     50000      Y              91500000.usb   otg
>                                                                                             deviceless   no_connection_id
>                    hs_usb1_ahb_gate  1  1  0  200000000   0   0     50000      Y              91540000.usb   otg
>
> Regards,
> Jiayu Du
>> +
>> +K230_CLK_RATE_FORMAT(hs_hclk_src_rate,
>> +		     K230_HS_HCLK_SRC_RATE,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
