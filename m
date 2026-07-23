Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C05C531C7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=51x3JMJWqOApQwbvQMAK7N8bcW85Lw+xGj0YUv/XQs8=; b=xLhVH6jGAKRG9W
	y+6F8tNgfbnLFaDd1K4nZKCqQwwiEtrorPMBo+fWP0GVC5tZIKBIKu+Rd1ljsHGOsWtSAomnZOf73
	xl1h+/f9dPi6GKzTnzBIrk6rV8jZ1zjDQtMactm8YEncO8cHqOmDsUMevoTYDvOgg8zq3KN+/xTmI
	7KmA0AdvAhkt1KqXpgiRLqBl5EJZeb5CdnOFAjE/PtDq2iQIWluwSfx0CiCpVEf6l+YO2W4Hjd3ZB
	LKkAO6OtgQEnFTr4gReshcJvcl/vj7DEJxoIpUufThRTeQr8SOPmvA4DJUncPqCll4cexnAt3kpH0
	b4+7zhmcCSKe1cyB91Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpsd-0000000Dtda-3V0J;
	Thu, 23 Jul 2026 09:38:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpsd-0000000Dtc3-1a41
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Jul 2026 09:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=RisjMK7/whMjDTixrc/bjJy3jqv7ZqFPk6rSUsbjbRA=; b=ObO9AjKF0+u3r9Qjm8jePGoxKe
	PdKbq3lzbGL7t1QpvviD55Ad709vdYFxYtXHHa0whOzC4qeEGCY5zgyB6caq8gg0E/vP0aX0MyZI8
	MZ+586ElAGNTVzusO4Z5fs5W+ID7FCZodg+q33Vrl/0UW4d7JRXy2srhcbd+lEltEhxlASRtkZEcP
	MiKfym2Dz36Iz4LiopxcpdT6bP2hwENARHXrvYJPfOuqzjNJuD3CiP89Uv/odgRlYUW9cW8y4Ae49
	mws9mToJ3lZ3J/jA3qZUb6ZmZTItoxu3OY7ObVsStyCwfxAamEpFFjYGuUcatPaSGnsSTLHU4P5M4
	KpJdnA2A==;
Received: from mxct.zte.com.cn ([183.62.165.209])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmpsY-00000001bxs-24lx
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 09:38:12 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4h5Qyq3JCZz57HS1;
	Thu, 23 Jul 2026 17:37:55 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl1.zte.com.cn with SMTP id 66N9bpJW087992;
	Thu, 23 Jul 2026 17:37:51 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from mapi (szxl2zmapp06[null])
	by mapi (Zmail) with MAPI id mid12;
	Thu, 23 Jul 2026 17:37:53 +0800 (CST)
X-Zmail-TransId: 2b086a61e0f12bf-4ad4c
X-Mailer: Zmail v1.0
Message-ID: <20260723173753894Kxzf20CEYWY6st6LVYgGn@zte.com.cn>
Date: Thu, 23 Jul 2026 17:37:53 +0800 (CST)
Mime-Version: 1.0
From: <gao.rui@zte.com.cn>
To: <jiangfeng@kylinos.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kees@kernel.org>, <andy@kernel.org>,
        <linux-hardening@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAyLzJdIGt1bml0OiBzdHJpbmc6IGFkZCBzdHJubGVuIFNJWkVfTUFYIHRlc3QgY292ZXJhZ2U=?=
X-MAIL: mse-fl1.zte.com.cn 66N9bpJW087992
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 23 Jul 2026 17:37:55 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A61E0F3.000/4h5Qyq3JCZz57HS1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_103811_040542_BD49BA5E 
X-CRM114-Status: UNSURE (   5.05  )
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

>> Extend string_test_strnlen to validate strnlen behavior with
>> SIZE_MAX input:
>> ...
>> +            /* Test Count overflow fallback */
>> +            KUNIT_EXPECT_EQ(test, strnlen(s, SSIZE_MAX), len);

On 2026/7/22 15:10, Feng Jiang wrote:
> A similar patch has already been submitted:
> https://lore.kernel.org/all/20260526085913.429049-1-min_halo@163.com/Thanks for the pointer.

I checked the patch, but it does not actually cover the **Count overflow** case.
so my patch adds an explicit case for `strnlen(s, SIZE_MAX)`.
--
Best regards,
Gao Rui

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
