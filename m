Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34888C77B70
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 02:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1dm1uPYrwFAi03EEFP24Pfunjr1cXJPWlaNP74xA4E=; b=Jc+HaJsx3gXHAk
	Sgq8OrIb6jGp68I671czQSrZdmMHlTwG9Y9X7ygJFjrgdFqhI9pMjq5xwMvTu77sHc84Vk6fdn4q5
	mU7WFIXuMpb3D4cexkp8fHfCJy3gcx8v4KQMHQp9J2AxDtR2GqDaY6xa54aih3K5JN9+kwbU05L6M
	1J8ooAqBinT3DjUya+rsglQf9HPbzmBouP4Vyek9upP7HearlQYjKhVrS1gHo8ZH2nHPkG2O0ORX9
	wOX0ARZaP1eKJInF90siEfpup8jLc6lTF0wuc1vcAmFeWsW49+MI5FNgc29E4psTH02Dbtia9nCac
	jpDn+/+12bXhE7WLO8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQLE-001d6T-1j;
	Wed, 12 Apr 2023 02:36:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQL8-001d4n-2e
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 02:36:10 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1B98D24E203;
	Wed, 12 Apr 2023 10:36:02 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:36:02 +0800
Received: from [192.168.125.89] (113.72.145.176) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:36:01 +0800
Message-ID: <fa83f623-517f-9b4f-9b82-9cae4a0aba60@starfivetech.com>
Date: Wed, 12 Apr 2023 10:36:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the
 allowlist
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411083257.16155-1-mason.huo@starfivetech.com>
 <20230411083257.16155-3-mason.huo@starfivetech.com>
 <20230411-rewire-outlook-a5fb631fb635@wendy>
From: Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <20230411-rewire-outlook-a5fb631fb635@wendy>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_193607_158535_7BB3ADD6 
X-CRM114-Status: GOOD (  10.71  )
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



On 2023/4/11 17:20, Conor Dooley wrote:
> On Tue, Apr 11, 2023 at 04:32:56PM +0800, Mason Huo wrote:
>> Add the compatible strings for supporting the generic
>> cpufreq driver on the StarFive JH7110 SoC.
>> 
>> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
>> ---
>>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
>> index e85703651098..a1ac955aa7e2 100644
>> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
>> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
>> @@ -92,6 +92,7 @@ static const struct of_device_id allowlist[] __initconst = {
>>  
>>  	{ .compatible = "xlnx,zynq-7000", },
>>  	{ .compatible = "xlnx,zynqmp", },
>> +	{ .compatible = "starfive,jh7110", },
> 
> This struct looks to be in alphabetical order with a blank line between
> vendors.

Right. Should place it behind "st-ericsson".

Thanks
Mason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
