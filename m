Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327C8CD98D8
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jun 2026 06:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/nQjjJyKEwT340tb1bGV9rRPoKUY9Ti+4vwnSKwmjVU=; b=uE86UqRx1tcuTF
	SC2dBHhnfTXIciFJbsIz36qnfxlYV+NPuSrIp5uk4L8EXis3EjajFHMddK/NKZv3koQjr8k+ZIv+q
	0fopm/VD3KhMbU7OQVzB5HN+UgeEhoOoT0yp+joPydPxpmNzr0hyv1+3YklXUyFqkCDEtSBQ8cnXE
	oeZxB9pQhQKSyJRiJhgAHeeuPRN5P3EDfYx9kjgVr4vrGlRGR0nr1rT8BFQWGgxNUSfgBybUXG7W4
	mimu/JNeik1sS4f3q2xNPqMtg2RCWAfNqum/icwmbKbXh1C8s8hi0fiJsk8i/If4J1KZ/eTNUYe2s
	zU5eGEAbqiBeyHaChwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYeg4-0000000Cn9K-3x6o;
	Sun, 14 Jun 2026 06:50:40 +0000
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYeg1-0000000Cn8r-1tUm
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jun 2026 06:50:39 +0000
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9AC466012D;
	Sun, 14 Jun 2026 08:50:14 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------RVgHdrMwKXEsVedW0RgSV6O5"
Message-ID: <f031e13e-d9f5-414a-b90e-a3d5a60b8d05@online.fr>
Date: Sun, 14 Jun 2026 08:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vincent Legoll <legoll@online.fr>
Subject: [PATCH] riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1,
 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Yixun Lan <dlan@kernel.org>
Content-Language: en-US
In-Reply-To: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_235037_656880_99173D7D 
X-CRM114-Status: GOOD (  11.07  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------RVgHdrMwKXEsVedW0RgSV6O5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[RESEND] as I cannot see yesterday's


Hello,



I tested (on OrangePi RV2) the attached patch applied over

spacemit/for-next + Shuwei Wu's V3 series.


This is a copy/paste of Shuwei Wu's work, so I don't know

if I can submit this with my SoB or if it should be done

differently, please advise.


Anyways, you can add my:

Tested-by: Vincent Legoll <vincent.legoll@gmail.com> # OrangePi-RV2


To the relevant patches from your series, if that's useful,

because it looks like it is working properly:


On Void linux (musl libc):


uname -a
Linux opirv2 7.1.0-rc1-00043-gb860bca13be4 #14 SMP PREEMPT Sat Jun 13 
11:02:13 CEST 2026 riscv64 GNU/Linux

awk --version | head -1
GNU Awk 5.3.2, API 4.0

echo userspace > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor

echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.300s
user    0m0.299s
sys     0m0.001s

echo 1228800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.432s
user    0m0.429s
sys     0m0.004s

echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.476s
user    0m0.476s
sys     0m0.001s

echo 819000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.582s
user    0m0.581s
sys     0m0.001s

echo 614400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.778s
user    0m0.773s
sys     0m0.005s

-- 

Vincent Legoll


--------------RVgHdrMwKXEsVedW0RgSV6O5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-riscv-dts-spacemit-orangepi-rv2-Add-cpu-scaling-for-.patch"
Content-Disposition: attachment;
 filename*0="0001-riscv-dts-spacemit-orangepi-rv2-Add-cpu-scaling-for-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5OTI0Nzg5NjU1YWU1ZjRmOThlN2E1Y2RjM2RmM2YzNGU3YmZiNjU5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBWaW5jZW50IExlZ29sbCA8dmluY2VudC5sZWdvbGxA
Z21haWwuY29tPgpEYXRlOiBTYXQsIDEzIEp1biAyMDI2IDEwOjQ5OjM0ICswMjAwClN1Ympl
Y3Q6IFtQQVRDSF0gcmlzY3Y6IGR0czogc3BhY2VtaXQ6IG9yYW5nZXBpLXJ2MjogQWRkIGNw
dSBzY2FsaW5nIGZvciBLMQogU29DCgpFbmFibGUgQ1BVIERWRlMgb24gT3JhbmdlUGkgUlYy
CgpUaGlzIGlzIGEgY29weS9wYXN0ZSBmcm9tIFNodXdlaSBXdSdzIEJQSS1GMyBEVFMgbW9k
aWZpY2F0aW9ucwoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBMZWdvbGwgPHZpbmNlbnQubGVn
b2xsQGdtYWlsLmNvbT4KLS0tCiAuLi4vYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGkt
cnYyLmR0cyAgICAgfCAzNSArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MzQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cwppbmRleCA3YzQ5YmNlNDI3
ZjMuLjYyZDI1ZjU3OWFmNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCisrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cwpAQCAtOCw2ICs4LDcgQEAKIAogI2luY2x1ZGUg
ImsxLmR0c2kiCiAjaW5jbHVkZSAiazEtcGluY3RybC5kdHNpIgorI2luY2x1ZGUgImsxLW9w
cC5kdHNpIgogCiAvIHsKIAltb2RlbCA9ICJPcmFuZ2VQaSBSVjIiOwpAQCAtODAsNiArODEs
MzggQEAgJmNvbWJvX3BoeSB7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJmNwdV8wIHsK
KyAgICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMV8wdjk+OworfTsKKworJmNwdV8xIHsKKyAg
ICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMV8wdjk+OworfTsKKworJmNwdV8yIHsKKyAgICAg
ICBjcHUtc3VwcGx5ID0gPCZidWNrMV8wdjk+OworfTsKKworJmNwdV8zIHsKKyAgICAgICBj
cHUtc3VwcGx5ID0gPCZidWNrMV8wdjk+OworfTsKKworJmNwdV80IHsKKyAgICAgICBjcHUt
c3VwcGx5ID0gPCZidWNrMV8wdjk+OworfTsKKworJmNwdV81IHsKKyAgICAgICBjcHUtc3Vw
cGx5ID0gPCZidWNrMV8wdjk+OworfTsKKworJmNwdV82IHsKKyAgICAgICBjcHUtc3VwcGx5
ID0gPCZidWNrMV8wdjk+OworfTsKKworJmNwdV83IHsKKyAgICAgICBjcHUtc3VwcGx5ID0g
PCZidWNrMV8wdjk+OworfTsKKwogJmVtbWMgewogCWJ1cy13aWR0aCA9IDw4PjsKIAltbWMt
aHM0MDAtMV84djsKQEAgLTE2Miw3ICsxOTUsNyBAQCBwbWljQDQxIHsKIAkJZGxkb2luMi1z
dXBwbHkgPSA8JmJ1Y2s1PjsKIAogCQlyZWd1bGF0b3JzIHsKLQkJCWJ1Y2sxIHsKKwkJCWJ1
Y2sxXzB2OTogYnVjazEgewogCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDUwMDAw
MD47CiAJCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzQ1MDAwMD47CiAJCQkJcmVn
dWxhdG9yLXJhbXAtZGVsYXkgPSA8NTAwMD47Ci0tIAoyLjU0LjAKCg==

--------------RVgHdrMwKXEsVedW0RgSV6O5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--------------RVgHdrMwKXEsVedW0RgSV6O5--

