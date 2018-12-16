Return-Path: <SRS0=9k1K=OZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E37C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 16 Dec 2018 23:35:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 518F0206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 16 Dec 2018 23:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKwUCB2t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="d05wh8SR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 518F0206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UKEyYzf5lOctGftes2G5is6EVooNTavIKNR2CLvG6xU=; b=OKwUCB2tl60YN0J/b7tg0O3S7k
	hEtnzo/hg3TucOkce02t4IOGI1ajB1BbxWDzWJJU1LeNir6NQgnmBAOP8jSLf9bgiiOTVsDqXlFh0
	C0m5XpXhN6A7B9SY5qtKHs0bntxUeNFdeIGLXIb6jCBbGpzwanEDE+ULEFqElXRGCALc3tdFu4BAr
	+cOh/cqS29w3CqHZq3IcE9Tmm68ghegmKHTkpNNVF0OuQRN9v4pvtcw5Sb3nOJYIEeDDlm1E3sT9f
	W8DkOrhkRJxvo22W1tqzoSA0zrgoQPckebm56RNgwJCvTeeXsIiT51Yyz4FvQRNAUFVHLO0EbwzAD
	oShSZdRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYfx0-0001F8-0C; Sun, 16 Dec 2018 23:35:58 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYfwx-0001Ee-JT
 for linux-riscv@lists.infradead.org; Sun, 16 Dec 2018 23:35:56 +0000
Received: by mail-pg1-x544.google.com with SMTP id w6so5193357pgl.6
 for <linux-riscv@lists.infradead.org>; Sun, 16 Dec 2018 15:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=a2W2Erohv2kN1VDg1izFU8S9EnOS9gkcFOLAHDQ1PWI=;
 b=d05wh8SRaVQJodD5iplqgKPG8oSHs3aViY+not3uTNBNxpIKOOP3tEhYOrGOBPnDHl
 /OfxBH7d92IHlFEaX41xYQj1sWtrQ/vZW9en8mmmkvKAgi9qzpdVy2Nf+omtMLMHgMWO
 B5M+b/mrgeG7FG/V+g3IFGAjOKZ2W8LKwYPyWpCrIzKsxJ2/bS3iNC6fbKuWqj8sfKny
 NxVVB8wM1FFZYJww+rseq1DDUxYrrkrrl5llkjB5XTA/D9DkyssG74Ki69T8E04s+478
 qQ8oQrErsJk5JsiIxBairMHTEuCXNaBNaKmM/Rc+iGY3ZXURux2x2iZdagckH6CPpJxX
 s1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=a2W2Erohv2kN1VDg1izFU8S9EnOS9gkcFOLAHDQ1PWI=;
 b=eCyO4yR4dtDSuN4LcNweQ5v7wUOB1aevukgmkaLxPjxMfHswsm/w1ofxOqJJURsppc
 4TlUn8Zp/2XJL3LfrVsYfdjz2NJwauqrz8Dsf52fMybv/VvqSm+c2oLvlrduCqOTTAwq
 nb3HKhyx4fjUT1fVa5fnBlsxbKdx7OVNsiY0fNuo+PQjjZz5xCy2fgJJMv+zMlCVt8Y+
 zMU8Rw4ZgixPs1tEQcM3274ZMaMPwv7StsP5DahMWgv0Tll00Fo7fOUBckoujWxyuemr
 9ztv6duqE6SAyni6cNjtsKWVH50YFgqcGGWf/nX4Da0DyNqV8AbEIx1fDHT7D+Bg5xhw
 ROQA==
X-Gm-Message-State: AA+aEWavBADyK0UXhTOCwdx8fLLt2kpombBtzIhKAhvz5CJDaGuDtNj8
 PDKRL+Q4TWLyTBnd0nJUQ6qoYp7Col4=
X-Google-Smtp-Source: AFSGD/VSe6tpgshFdVu6u/+4e/zr889PgKO2jZP7I1hFsiU/wLbRCOpLHFlmQZgplVFRQ6ZSYeRNWQ==
X-Received: by 2002:a63:dd55:: with SMTP id g21mr10105713pgj.86.1545003344128; 
 Sun, 16 Dec 2018 15:35:44 -0800 (PST)
Received: from ?IPv6:2607:f598:b382:d300::14ef? ([2607:f598:b382:d300::14ef])
 by smtp.gmail.com with ESMTPSA id
 x28sm19933524pge.66.2018.12.16.15.35.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Dec 2018 15:35:43 -0800 (PST)
Subject: Re: [PATCH 0/7] arch: riscv: add DT file support, starting with the
 SiFive HiFive-U
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
From: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <41dac7a1-3f66-6a3f-8a68-206688e5bd9e@sifive.com>
Date: Sun, 16 Dec 2018 15:35:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181216_153555_676840_1A6C4C0D 
X-CRM114-Status: UNSURE (   7.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Li4gYWxvbmcgd2l0aCB0aGUgUFJDSSBwYXRjaGVzIHdoaWNoIGFyZSB1bmRlciByZXZpZXcuCgpX
aWxsIHJlcG9zdCB0aGVzZSBzdWNoIHRoYXQgdGhlIGZpbGVzIHRoYXQgZGVwZW5kIG9uIHRoZSBu
ZXcgY2xvY2sKaGVhZGVycyBhcmUgYXQgdGhlIGVuZCBvZiB0aGlzIHNlcmllcy7CoCBUaGVuIHdl
IGNhbiBzZW5kIHRob3NlIGxhc3QgdHdvCnBhdGNoZXMgYWZ0ZXIgdGhlIGNsb2NrIG1lcmdlIGlu
IHRoZSBtZXJnZSB3aW5kb3csIGFzc3VtaW5nIHRoZSBQUkNJCnBhdGNoZXMgbWFrZSBpdC4KCgot
IFBhdWwKCk9uIDEyLzE0LzE4IDk6MjEgUE0sIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4gQXBwbGll
cyBvbiB2NC4yMC1yYzYuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
