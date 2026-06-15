Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E38CD98C7
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZVB47RPKbmwntqq2uFPBCkTNjhmqdIn/D8HxLlOwkE=; b=D6/56l31Ccmbme
	wYLVUWAqXdH3BR6JBEYiYenUmuGD7NqMH8W6SJj70WjRitvK3Pz5fyOIErUxmQ6gytELEDH4+BUAS
	Avh/2cmPpcuW94TNY1pYDoB2zrMCXrnCBSZjxGZYXQrMTo6ksSmBMLeVXKgDHJdSvkdqJ4D4VLIEh
	KOOdMVfXZNzqTwzyRKYgZiXmB19oZjg4bnznFvEuoRdxEZSUgYtfOswDqwW1AY6dTOz7rZIXhu4FN
	gDWjd9kNJ9k43Dn+11LHRLIPkkOalxsJ9cMUkuxoLfuSS6fPt8Q+0BNbe6gbffi04uVDJyxWznSkv
	xft6JUXvhiXVrU90lKZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ69x-0000000E9FP-2KBf;
	Mon, 15 Jun 2026 12:11:21 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ69t-0000000E9Eb-2ENq
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 12:11:20 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gf89D2qK2z9vCH;
	Mon, 15 Jun 2026 14:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781525472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2ni2HKLJTKwWZDPeU4N3Yd1IXA3apJPvhe3IpmDCyc=;
	b=Lrd3GhbCEc5wkRYKdr2J366BSm0U6EkvUYfCptFiN9eJRq+LITYHf3+5N8ANNvuNXLOJ6k
	8lvR3SYktrUnYFp4ZOWQibYOL1iVpIFxe/rD6QJzOFERqj4qbSQN94qDW6hXWEmF+JJ29b
	DPO2Yvp45sdI2YgMxR+Y+EWn8gkC9KuME+ViX54t222iAWcm4PJnydxnAzL7KW0aaytNZp
	ymhDbnOF9Xjo6It6uDPDKzgCDQcVaXews96bYjsd78yjj4BQUodKP6WiKVCJO/c8sug//A
	JpRmUJkSCPmMxotQUfUn/fyX8KiZnmeE5JhH2Z0OsnlMqpf4e/P845hOCqbr/g==
Mime-Version: 1.0
Date: Mon, 15 Jun 2026 20:11:01 +0800
Message-Id: <DJ9M2IDYE6XZ.20RN5AFBYNB9Y@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan" <dlan@kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Viresh Kumar" <viresh.kumar@linaro.org>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
 <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
 <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>
 <wjwkykv555gkeqxabsqcdfn4lomcopawsv7bgm4bydc5likhjs@p3ca3p7wbri5>
In-Reply-To: <wjwkykv555gkeqxabsqcdfn4lomcopawsv7bgm4bydc5likhjs@p3ca3p7wbri5>
X-MBO-RS-ID: 8f80bbf1dd5291ba946
X-MBO-RS-META: edisx4wchww8awjnyt6qkyss1w8jk1uh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_051118_863080_4AA3DDB1 
X-CRM114-Status: GOOD (  18.10  )
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

Hi Viresh,

Thanks for pointing it out.

On Mon Jun 15, 2026 at 2:34 PM CST, Viresh Kumar wrote:
> Hi Shuwei,
>
> On 15-06-26, 14:12, Shuwei Wu wrote:
>> The clusters have separate clocks, but they share the same voltage supply.[1]
>> So two independent policies would be unsafe: one policy could lower the shared
>> voltage while the other cluster is still running at a higher frequency.
>
> No, both will vote for the regulator contraints using CPU device and the
> regulator core will make sure it doesn't break any of them. This is what all
> frameworks do, regulator, clk, etc.
>
>> This means they can't use different policies.
>
> This is incorrect.
>
>> From a hardware perspective, the eight cores of the K1 are homogeneous,
>> so using the same policy for them is relatively reasonable.
>
> Right, but this is inefficient. One cluster can be idle, or in low freq mode
> while other can be in higher. They MUST be two policies.

Yes, you're right. Two policies are not inherently unsafe.
The regulator framework handles multi-consumer voting correctly.

The actual problem was using single value opp-microvolt. With one cluster at
a low frequency holding a precise [950000, 950000] on the shared rail, and the
other requesting [1050000, 1050000] for 1.6 GHz, the regulator finds no
intersection:

~ # echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
[  544.744195] buck1: Restricting voltage, 1050000-950000uV
[  544.757073] cpu cpu0: _set_opp_voltage: failed to set
              voltage (1050000 1050000 1050000 mV): -22
[  544.771304] cpufreq: __target_index: Failed to change
              cpu frequency: -22

The fix is to use the <target min max> triplet for the lower OPPs so the
regulator always has a valid intersection:

-    cpu_opp_table: opp-table-cpu {
+    cluster0_opp_table: opp-table-cluster0 {
         compatible = "operating-points-v2";
         opp-shared;
         opp-614400000 {
-            opp-microvolt = <950000>;
+            opp-microvolt = <950000 950000 1050000>;
         };
         opp-819000000 {
-            opp-microvolt = <950000>;
+            opp-microvolt = <950000 950000 1050000>;
         };
         ...
         opp-1600000000 {
             opp-microvolt = <1050000>;
         };
     };
+    cluster1_opp_table: opp-table-cluster1 {
+        // same OPP entries and voltage ranges as above
+    };
-    &cpu_0 { operating-points-v2 = <&cpu_opp_table>; };
+    &cpu_0 { operating-points-v2 = <&cluster0_opp_table>; };
     ...
-    &cpu_7 { operating-points-v2 = <&cpu_opp_table>; };
+    &cpu_3 { operating-points-v2 = <&cluster0_opp_table>; };
+    &cpu_4 { operating-points-v2 = <&cluster1_opp_table>; };
     ...
+    &cpu_7 { operating-points-v2 = <&cluster1_opp_table>; };

This way the low frequency cluster accepts up to 1.05 V on the rail.
That is safe: high voltage at low frequency costs power but does not cause
instability.

With two cpufreq-dt policies (one per cluster) and these ranges, neither cluster
blocks the other. Tested on BPI-F3 and OrangePi Rv2 boards, works as expected.

Does this look good to you, or would you prefer a different approach?
>
>> I used a K1-specific driver because cpufreq-dt only manages one CPU clock
>> through the CPU device used for the OPP transition.
>> On K1, the policy needs to control two independent cluster clocks and one shared
>> regulator, so the driver has to update the second cluster clock explicitly and
>> keep the ordering safe: raise voltage before raising either cluster, and lower
>> both cluster clocks before lowering the shared voltage.
>> 
>> [1] https://lore.kernel.org/spacemit/aeaXszeaE62rM6BJ@aurel32.net/

-- 
Best regards,
Shuwei Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
