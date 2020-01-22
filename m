Return-Path: <SRS0=iMHb=3L=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B6CC2D0DB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2020 09:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E02B2467B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2020 09:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KKs4xfE1";
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p36AdP8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E02B2467B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hJ8kusPs1E5fpY4a5D7xRZyxB9IVTg1EwmjR7GUtYSc=; b=KKs
	4xfE17ZPtVlD610MSrj1RrhD0MxiJ5xiJj9sNXM9MZBCvql/B61pgC+6CTCliRrelSD9VXdCFloza
	G/YNbTTJdtvzVKHYTz15jDsPLfe9ZdOjg0JQVVBvJWF0+kYemy9Gf6QRmAsGIrbC7IprGtaBZLLvV
	y9nMO5XPHxbzoaLqLt7wutIEKca6OOggDJBTPFqtAQQRoIhn7BJ/TfVEra1H8CMarpxZnw9II3eRg
	sJoyL/d3m0naip0O+9XCaeaZNYkyzFz0sWucgWH5KrLoJNAdMtJ+qSKQvl2/I3RP0sZWcyMPcz3o1
	n2SV+kILuxekyvxD2ffh79Sm3xwkVHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuCRT-0001zR-I2; Wed, 22 Jan 2020 09:36:55 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuCRQ-0001yR-6Y
 for linux-riscv@lists.infradead.org; Wed, 22 Jan 2020 09:36:53 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00M9XeFS103343;
 Wed, 22 Jan 2020 09:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=hJ8kusPs1E5fpY4a5D7xRZyxB9IVTg1EwmjR7GUtYSc=;
 b=p36AdP8kg6+4XQZ7RpyxjicO4pEFTq/pZRIHzB2cI+PeiagOzXf2BYNm3QAN37yYOZZa
 8m7YO84EssXNIud4xS9fY2MvjZaKlSXuZ4ZrgKqrBGCKIatp3JUb61LrWk97aimgNVeb
 P8FnHrzVSyjGRkjAUp31nsSPkyOVrcpuDk+TFdaJFr9p8fGsFW8taPnFeN3DNlyS9kS5
 RYu/8qJvz5EMQo55bWNRBRnxwyoBMqdq5JPAbEzwUELCfXcS0mqOk0VUgZdikea6Nz6Y
 TAx+Jf8iIFYMLg5RXXOs5ZDSTNbbcTFfwTH3zoaGD/9jyXIIUv659BozBqhrKPUM+EW/ cQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2xkseujmys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 09:36:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00M9XrbW154968;
 Wed, 22 Jan 2020 09:36:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2xnsaanb7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 09:36:50 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00M9anld028525;
 Wed, 22 Jan 2020 09:36:50 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Jan 2020 01:36:49 -0800
Date: Wed, 22 Jan 2020 12:36:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: yash.shah@sifive.com
Subject: [bug report] gpio/sifive: Add GPIO driver for SiFive SoCs
Message-ID: <20200122093642.jneuumkqojgem5hk@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=1 mlxscore=1 mlxlogscore=185
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001220087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=239 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001220087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_013652_322792_DD9347D0 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Yash Shah,

The patch 96868dce644d: "gpio/sifive: Add GPIO driver for SiFive
SoCs" from Dec 10, 2019, leads to the following static checker
warning:

	drivers/gpio/gpio-sifive.c:97 sifive_gpio_irq_enable()
	warn: passing casted pointer '&chip->irq_state' to 'assign_bit()' 32 vs 64.

drivers/gpio/gpio-sifive.c
    86          gc->direction_input(gc, offset);
    87  
    88          spin_lock_irqsave(&gc->bgpio_lock, flags);
    89          /* Clear any sticky pending interrupts */
    90          regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
    91          regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
    92          regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
    93          regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
    94          spin_unlock_irqrestore(&gc->bgpio_lock, flags);
    95  
    96          /* Enable interrupts */
    97          assign_bit(offset, (unsigned long *)&chip->irq_state, 1);
                                                    ^^^^^^^^^^^^^^^^^
Better to just declare ->irq_state as an unsigned long so you don't
have to worry about endianness.

    98          sifive_gpio_set_ie(chip, offset);

regards,
dan carpenter

