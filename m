Return-Path: <SRS0=mmvj=Q3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A85C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Feb 2019 19:57:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422BD2147A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Feb 2019 19:57:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tPx37JM2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUzGQ3YB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 422BD2147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7gkGL6zsCTkXxSn1iU+AHhi9g5/oCaCgCTAC4AZOdp4=; b=tPx37JM2vVq1NG
	/2cywH0EZ9ryQ4ZMFWvj/qMDsR90/LYd/+egMFRjCYCf5/rT1DanSWIWiLtFdAbCguCvGR9ojIiPI
	ZSJvUclac925l/JKTGbWhexAy9LnfQ3J5Gg0O1j/SQE9Jfdq2yg4pPzMco+j8g6/wrvtF2dBOy4sw
	soiLm81lXE3k+hjp9B0gSC13XgeUz66VnqCx7MJ/NJ4jx39arAMKquarpptaKck1e4ZJS+LvzrNKD
	JNXcMd0fP0C7oUtz3wASk4YofViATFINqa4VvP3tm695GGpFDaeWoP8XzoBMbZ8cE1NFKSnJeypY4
	uEjupI9H0w+g1K5YbNnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwXza-0007tk-Mo; Wed, 20 Feb 2019 19:57:18 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwXzX-0007tN-Km
 for linux-riscv@lists.infradead.org; Wed, 20 Feb 2019 19:57:17 +0000
Received: by mail-qt1-x829.google.com with SMTP id o6so28708130qtk.6
 for <linux-riscv@lists.infradead.org>; Wed, 20 Feb 2019 11:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=MM+1yXPA0a61If2fLKSFf1Q15IV232vqhLE/5XgnV84=;
 b=RUzGQ3YBdjqn+FwlacSFuI1AuxWcohKYQgXPYg8Hy1+JlRK1j4pq3yFhdoqM59gVMP
 S5V0jH+hoIkRke7TDVIEFtG6L9HY1VN7G1SwjHR1kNBjFydZPa/qH5OkLqX0BV1fiwXk
 exEqkdtDlTeKvAU9Cb1btY8aInqwls149T/mOuyXCAITWjUx0VdVqxPptclPYirdnikq
 az9x3zWqS7RVDEJ20tzYi+VIAZgo4g8Af9OOH2vZRlHkf6hAWj3pvLQJ2UIbVzfhq7Xp
 kLCqh5e8CWGnkqbMjq6Iz17V/tGOCTtqodSL6yHjjMwrlrC7plcuxPN3EiAwUK2Zbd7e
 3hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=MM+1yXPA0a61If2fLKSFf1Q15IV232vqhLE/5XgnV84=;
 b=htHVaImlXY3QgAoUbAuvqOd4xVVEGIXANFwVBimJBHBLweqv3xijG0MbYcMcZo7zD+
 085+SBbU9FnooVZPQpXZ09rL49Ka4gEzkQHfnujZo7VKtruSiorpK06pXm1LjZ6D2KUt
 E7H3Le5d37Kp3u+m+aHbIb/KWgIx6eI2nnVRLJ/461XeUyHWLJA5NemMEKu2PSG0cJxc
 bH8lbwrS5ECde7zQmurM4+YIqClPxwgTKUqHOZ3L0SMXm3rPmlZI0hYvDDYBtjE2pcKs
 SarNolaKlMYeEhzzmYgOKMstZKNTBRoktUNNmnGKbrkeck1xgWpQPOSRbrvQ+i6NqX9K
 /tnQ==
X-Gm-Message-State: AHQUAuY1Ey07GG2/q42wr1Qx0UC3nVhAnVc6TT5/Et/QHOr6VBbhAiTS
 aHPPxUHanfqGPEW+QpLqVrWYWRXQQQzrAjNHAyjtYyMFz34=
X-Google-Smtp-Source: AHgI3IbT25dzQh+BHNb66FdfVAhHo8rM+LjnrIbOGypBEtZjbOUunAjrYH9Ed/kzzh4l7+2mvDABc97Esp2uZ65Nmiw=
X-Received: by 2002:aed:3783:: with SMTP id j3mr29552224qtb.16.1550692633525; 
 Wed, 20 Feb 2019 11:57:13 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 20 Feb 2019 20:57:02 +0100
Message-ID: <CAJ+HfNgwAFevO6cXMU_FjQtLJ=uxHmmWM8c-VWu58SMkKXgVyQ@mail.gmail.com>
Subject: per-cpu thoughts
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_115715_678894_65F96EA9 
X-CRM114-Status: UNSURE (   3.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Lameter <cl@linux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpDaHJpc3RvcGhlciBtZW50aW9uZWQgInBlci1jcHUgYXRvbWljaXR5IiBpbiBoaXMgUGx1
bWJlcnMgUklTQy1WIEhQQwp0YWxrIFsxXS4gVHlwaWNhbGx5LCB0aGlzIHdvdWxkIGJlIGZvciB0
aGUgcGVyLWNwdSBpbXBsZW1lbnRhdGlvbiBpbgpMaW51eCwgc28gSSBoYWQgYSBsb29rIGF0IHRo
ZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLgoKSSBub3RpY2VkIHRoYXQgUklTQy1WIGN1cnJlbnRs
eSB1c2VzIHRoZSBnZW5lcmljIG9uZS4gSGFzIHRoZXJlIGJlZW4KYW55IHdvcmsgb24gbW92aW5n
IHRvIGEgUklTQy1WIHNwZWNpZmljIGltcGwsIGJhc2VkIG9uIHRoZQpBLWV4dGVuc2lvbnMsIHNp
bWlsYXIgdG8gd2hhdCBhYXJjaDY0IGRvZXM/IFdvdWxkIHRoYXQgbWFrZSBzZW5zZT8KCkZpbmFs
bHk7IEhhcyB0aGVyZSBiZWVuIGFueSBtb3JlIGRpc2N1c3Npb25zIG9uIENocmlzdG9waGVyJ3Mg
aW5wdXQ/CgoKVGhhbmtzLApCasO2cm4KClsxXSBodHRwczovL2xpbnV4cGx1bWJlcnNjb25mLm9y
Zy9ldmVudC8yL2NvbnRyaWJ1dGlvbnMvMTk5L2F0dGFjaG1lbnRzLzExNy8xNDkvMjAxOF9QbHVt
YmVyc19IUENfaW5fUmlzYy5wZGYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
