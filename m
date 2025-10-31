Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7E7CCF9FA
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 10:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RxDevCRZIK4svTO3LJYzYxxjBpeldS2ufmvraKHEdA0=; b=R+J
	RHMubmb3VvZFmoaglxayQ4/r1gNoliZGh3sgfokpRYSC5NertbaTwqYuIl0yyF3IYwyIhTwZlSC/1
	Bb3PTWTPKSZ96qW3DuhjDk8Xa+4lM4WEqjS6xY4PVjfEai7qDP4nbFcPv1TFtCkBGQTMD6Gjz4R2v
	ng6q60WPsTX/BEFb/cPAzFZEhYeFcuLAsqjNq3mKbnzNzayf5L1HNDe5SQHjTaizKK57YsqCN02oo
	HDAmcaUhO3+6ievmQx+uxcngLLNb0vikBSaWBUOsKWsWDX/cb8fprTgI02KccQ3KxIhl2DwqBisGJ
	pyY8OKyVAr6Q7lkVu2QnXpGM7LLSchw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmpU-00000005yES-3Yud;
	Fri, 31 Oct 2025 10:58:00 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmpS-00000005yE7-0Fs2
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 10:57:59 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-893c373500cso221509185a.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761908276; x=1762513076; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WlR6a+9sGYUN9Vv4fYTtGH9GXOMmtSRQQY8N+BlQJVA=;
        b=gAZnCR4W9XaIMdgqPXxvGBqEf+Xtr8sgBQO3MQmjaIGiq88ZoQF3cS6L21IzRSVgFG
         jXe9hABr+NLgaXKyDxWycmdz2mJih4+Qi9YzNQB0GFUG5ch6F83ukr/CqjwTlH+PVYqH
         GKHxxL8img5Fz2Mwpgro+xo713WiP6pZAVwvpry+dpFmVIchRLl6+8P1SMi7msCgj5XL
         euHCk3/TshgCswjnHDLtdu2NjKwJW+fZBRR7CWETqMwFzd3xaEU9klQKtUmqfiKi8CKH
         vtRbARIw2zGEFtPvcxc00GjfhloXw7sTgog7RfLnRr0urBjCTEGJwaGVyUDbcNtkMcA6
         Tv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761908276; x=1762513076;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlR6a+9sGYUN9Vv4fYTtGH9GXOMmtSRQQY8N+BlQJVA=;
        b=l0s/ucrztFGJLd3akr5bul90gf4AFRk+9/4Kon/pllWGOoEp/Y5MZaElonz9m36bP0
         i7EiJRmk2Wa39stwRsHNptL6dwFtUbsHWYcjIkcaKTUmBQ5WmZJrB7NWhNDQk4Fm6uRg
         XeYdqbN+tIx6lL4JTveLI6fAQaIjGgciOrA1/rKyB7N+ZCvAKdEcaDGq0CZI1kcoc1/q
         KPZ42ACoIqWwt0fOXFaYlHDt5kN/2d8eRWjFQahjfOPYxgZk5gTXU/saR4dt8EZUjkBJ
         I+gUWVrpxxapCxtQ3it+oKDg9Xssh97yE2yHulKi6M4+aDBOAFPq2t/FXGxOHCa3QU7g
         47ZA==
X-Gm-Message-State: AOJu0Yz4d+R1f1qB1J2yA0Tnd+0kE+9OcDV8vkasoCZsPUYMWTC60vS/
	aYVyuoG3I1Re1J+RDDYLNCluFiEKDD4wgJeLLbPYFAYI85HiiRhuw1kOE6zb7gmZBgm1AlE1HFr
	XFUCu7yLhTHZ5JzTTHjTlWXzia8ozjMhXhIde
X-Gm-Gg: ASbGncvnZq4iytHnZDpbXMEMbfPGr0O5q22+Kd1SfeftqRCmHBaZfKZEzk9huwxzOMQ
	LmQ2z9A0czhL31i7CnPTwCQ3ZiH3l/O9mD5+A3n7te9pEaOzhSvIUycT1aDe/DAyg+dbbFVmXiH
	tPFSrKILPY1PZlhFTw5webeMHJgfWrpWKhI11hoRwzgN4D5G6p5nUqqVFcjt8A4MqBQU3Q+cv19
	5XSSqVnDmZWbZqGedkZ9bz+xF341DbQ2SH9dkDeV+kCZBo4lClYaZt0y5CUHxmfjlo/up3zVjwN
	ZdfzPyGZpU++HmHfFnlvq2OEWAE6
X-Google-Smtp-Source: AGHT+IH1qhejWwhhMa9LM3d6XsFg1galvHaeZ0NUiuBk4/Tvnxeb3reGvWFXa7+529QLW2mWHFbWPsK8+aVMYTQJSV8=
X-Received: by 2002:a05:620a:440c:b0:8a6:1a5d:7af4 with SMTP id
 af79cd13be357-8ab7c756a28mr368987985a.20.1761908276476; Fri, 31 Oct 2025
 03:57:56 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Fri, 31 Oct 2025 11:57:45 +0100
X-Gm-Features: AWmQ_bm6QfuOZAme2foKByoyNZDdDnTbG5SqaL5Qshtb7LiKOzIhwHjtRoirYjw
Message-ID: <CAJ+HfNhAm3wxLFS-Mu_QuKtBZwDaQcGue4jiw4tDd5r4BvfGrQ@mail.gmail.com>
Subject: Call for Participation: RISC-V Devroom 2026
To: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_035758_133916_5B573E0E 
X-CRM114-Status: UNSURE (   3.80  )
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

SGVsbG8hCgpXZSBhcmUgcGxlYXNlZCB0byBhbm5vdW5jZSB0aGUgQ2FsbCBmb3IgUGFydGljaXBh
dGlvbiAoQ2ZQKSBmb3IgdGhlCkZPU0RFTSAyMDI2IFJJU0MtViBEZXZyb29tLiBUaGUgRGV2cm9v
bSB3aWxsIGJlIGhlbGQgb24gSmFudWFyeSAzMQooU2F0dXJkYXkpLCAyMDI2IGluIEJydXNzZWxz
LCBCZWxnaXVtLiBUaGUgc3VibWlzc2lvbiBkZWFkbGluZSBmb3IKdGFsayBwcm9wb3NhbHMgaXMg
RGVjZW1iZXIgMSwgMjAyNS4KCkZPU0RFTSBpcyBhIGZyZWUgZXZlbnQgZm9yIHNvZnR3YXJlIGRl
dmVsb3BlcnMgdG8gbWVldCwgc2hhcmUgaWRlYXMKYW5kIGNvbGxhYm9yYXRlLiBFdmVyeSB5ZWFy
LCB0aG91c2FuZHMgb2YgZGV2ZWxvcGVycyBvZiBmcmVlIGFuZCBvcGVuCnNvdXJjZSBzb2Z0d2Fy
ZSBmcm9tIGFsbCBvdmVyIHRoZSB3b3JsZCBnYXRoZXIgYXQgdGhlIGV2ZW50IGluCkJydXNzZWxz
LgoKIyBGT1NERU0gMjAyNiBSSVNDLVYgRGV2cm9vbSBDZlAKCkZPU0RFTSAyMDI2IChodHRwczov
L2Zvc2RlbS5vcmcvMjAyNi8pIHdpbGwgdGFrZSBwbGFjZSBvbiBKYW51YXJ5IDMxLApGZWJydWFy
eSAxLCAyMDI2IGluIEJydXNzZWxzLCBCZWxnaXVtLiBUaGVyZSB3aWxsIGJlIGEgUklTQy1WCmRl
dmVsb3BlcuKAmXMgcm9vbSBvbiBTYXR1cmRheSBKYW51YXJ5IDMxLgoKQW55IHRvcGljcyByZWxh
dGVkIHRvIFJJU0MtViBhcmUgd2VsY29tZSwgYnV0IHR5cGljYWxseSBlbmNvbXBhc3Nlcwp0aGUg
UklTQy1WIElTQSwgb3BlbiBzb3VyY2UgUklTQy1WIGhhcmR3YXJlIChlLmcuIGNvcmVzLCBTb0Nz
LAphY2NlbGVyYXRvcnMpLCBhbmQgb3BlbiBzb3VyY2UgUklTQy1WIHNvZnR3YXJlIChlLmcuIE9T
IHBvcnRzLAplbXVsYXRvcnMsIHRvb2xjaGFpbnMpLgoKIyMgUHJlc2VudGF0aW9uIERldGFpbHMK
CiogVGhlIGRlZmF1bHQgZHVyYXRpb24gZm9yIHRhbGtzIHdpbGwgYmUgNDUgbWludXRlcyBpbmNs
dWRpbmcKICBkaXNjdXNzaW9uLiBGZWVsIGZyZWUgdG8gcmVxdWVzdCBhIGxvbmdlciBvciBzaG9y
dGVyIHNsb3QuCiogUHJlc2VudGF0aW9ucyB3aWxsIGJlIHJlY29yZGVkIGFuZCBzdHJlYW1lZC4g
U2VuZGluZyB5b3VyIHByb3Bvc2FsCiAgaW1wbGllcyBnaXZpbmcgcGVybWlzc2lvbiB0byBoYXZl
IHlvdXIgcHJlc2VudGF0aW9uIHJlY29yZGVkIGFuZAogIGRpc3RyaWJ1dGVkIHRvZ2V0aGVyIHdp
dGggeW91ciBzbGlkZXMgdW5kZXIgYSBDcmVhdGl2ZSBDb21tb25zIENDLUJZCiAgbGljZW5zZS4K
CiMjIFN1Ym1pdCBhIHRhbGsKCkhlYWQgdG8gdGhlIEZPU0RFTSAyMDI2IHByZXRhbHgKKGh0dHBz
Oi8vcHJldGFseC5mb3NkZW0ub3JnL2Zvc2RlbS0yMDI2L2NmcCkgd2Vic2l0ZS4KCiogVGhlIHRp
dGxlIGFuZCBzdWJ0aXRsZSBvZiB5b3VyIHRhbGsgKHBsZWFzZSBiZSBkZXNjcmlwdGl2ZSwgYXMK
ICB0aXRsZXMgd2lsbCBiZSBsaXN0ZWQgd2l0aCB+NTAwIGZyb20gb3RoZXIgcHJvamVjdHMpCiog
U2VsZWN0ICJSSVNDLVYgRGV2cm9vbSIgYXMgdGhlIHRyYWNrLgoqIEEgc2hvcnQgYWJzdHJhY3Qg
b2Ygb25lIHBhcmFncmFwaAoqIEEgbG9uZ2VyIGRlc2NyaXB0aW9uIGlmIHlvdSB3aXNoIHRvIGRv
IHNvCiogQSBzaG9ydCBiaW8gYW5kIGNvbnRhY3QgaW5mb3JtYXRpb24KKiBMaW5rcyB0byByZWxh
dGVkIHdlYnNpdGVzIC8gYmxvZ3MgZXRjLgoqIFRhbGsgZHVyYXRpb24KCiMjIEltcG9ydGFudCBE
YXRlcwoKKiBEZWNlbWJlciAxLCAyMDI1OiBTdWJtaXNzaW9uIGRlYWRsaW5lIGZvciB0YWxrIHBy
b3Bvc2FscwoqIERlY2VtYmVyIDE1LCAyMDI1OiBBbm5vdW5jZW1lbnQgb2YgdGhlIGZpbmFsIHNj
aGVkdWxlCiogSmFudWFyeSAzMSAoU2F0dXJkYXkpLCAyMDI2OiBSSVNDLVYgRGV2cm9vbQoKIyBW
b2x1bnRlZXJpbmcKCkZPU0RFTSBuZWVkcyB5b3UhIEV2ZXJ5IHllYXIsIHRoZSBGT1NERU0gdGVh
bSBpcyBhc3Npc3RlZCBieSBhbgplbnRodXNpYXN0aWMgdGVhbSBvZiB2b2x1bnRlZXJzIHRvIGhl
bHAgb3V0IHdpdGggdmFyaW91cyB0YXNrcyBhbmQKbWFrZSB0aGUgZXZlbnQgYSBmdW4gYW5kIHNh
ZmUgcGxhY2UgZm9yIGFsbCBvdXIgdmlzaXRvcnMuCgpUaGVyZSBhcmUgc29tZSBiZW5lZml0cyB0
byBiZWluZyBhIHZvbHVudGVlciwgYnV0IG1vc3QgaW1wb3J0YW50bHkgeW91CmhlbHAgbWFrZSBG
T1NERU0gcG9zc2libGUhCgpWaXNpdCBodHRwczovL3ZvbHVudGVlcnMuZm9zZGVtLm9yZy8gdG8g
c2lnbiB1cC4KCgpDaGVlcnMsCkJyaWFuICdyZWRiZWFyZCcgSGFycmluZ3RvbiAoYmhhcnJpbmd0
b24gYXQgcmVkaGF0LmNvbSkKQmrDtnJuIFTDtnBlbCAoYmpvcm4udG9wZWwgYXQgZ21haWwuY29t
KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
