Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BE5C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KroKa9GEmSwmniJJJ4DFhu8g8lVmDECwvoMd3HTcGY8=; b=F491g8fxcX7KIh
	+5gUncBmmCNhvANLQbA6ujKRorHKJqOktJCarZ6Nx4iyT3cNU68kYgnL0/IsNmfa0bRNs0JaE30ao
	HXd4QHsnTgYn1a7Rl4YNWH7+g58i+YLO03yfbAwwkS+bBDl1hJAAjwBhLSEHPJEXqYD+e0AUqqYoR
	lI4RdnjE6Axd0gfgIgov5dZQ6pF5aSZWvJ2h3IBVRLn3FvbwAVADdf8hpzUTJGf8ZID1CLvHsn1ma
	VDe1MJw7hxytNLRUw7YIsTECNTm4ZahKSr0LaNwsEA86C8pXSp+NpP3xGeOYOGf8iD7SEEqksVMOM
	XV701rlpdxkBI3jpEkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1Ye-003Jui-TI; Mon, 20 Feb 2023 08:30:00 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1YY-003JmV-Mt
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 08:29:58 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4PKwZT1pCBz4f41V6
	for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 16:29:37 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP1 (Coremail) with SMTP id cCh0CgD3YSxyL_NjSWbkDg--.11659S2;
	Mon, 20 Feb 2023 16:29:39 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v2] riscv, bpf: Add kfunc support for RV64
Date: Mon, 20 Feb 2023 16:32:03 +0800
Message-Id: <20230220083203.2988238-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgD3YSxyL_NjSWbkDg--.11659S2
X-Coremail-Antispam: 1UD129KBjvdXoWrury3GFyxXrW7try3GFWUtwb_yoW3uFg_ur
	1xJa4Iq3y5Ja18JF4DuF4fArykCws3GFykXw1xZryjy3ZxWFn8ta4kKryjqry7Zr1YyrW7
	Xrn5Ja9aqw42qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
	QVy7UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_002955_456099_CFFD55E1 
X-CRM114-Status: UNSURE (   6.43  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkFzIGFub3RoZXIgaW1wb3J0YW50
IG1pc3NpbmcgcGllY2Ugb2YgUlY2NCBKSVQsIGtmdW5jIGFsbG93IGJwZiBwcm9ncmFtcwpjYWxs
IGtlcm5lbCBmdW5jdGlvbnMuIEZvciBub3csIFJWNjQgaXMgc3VmZmljaWVudCB0byBlbmFibGUg
aXQuCgpTdWdnZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KU2ln
bmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KLS0tCnYyOgotIEZpeCBl
bWFpbCBhZGRyZXNzIG1pc21hdGNoLgogCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
IHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jCmluZGV4IGY1YTY2ODczNmM3OS4uYTkyNzAzNjZkYzU3IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMKQEAgLTE3NTEsMyArMTc1MSw4IEBAIHZvaWQgYnBmX2ppdF9idWlsZF9lcGls
b2d1ZShzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKIHsKIAlfX2J1aWxkX2VwaWxvZ3VlKGZh
bHNlLCBjdHgpOwogfQorCitib29sIGJwZl9qaXRfc3VwcG9ydHNfa2Z1bmNfY2FsbCh2b2lkKQor
eworCXJldHVybiB0cnVlOworfQotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
