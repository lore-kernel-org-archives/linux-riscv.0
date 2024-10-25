Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0E3D149F6
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 23:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=iBCXrpYWWzaXaU8qziWJjt+0kKIwJqd/frWnWud8n7U=; b=PKR
	omvDQmRkS++KjdP96UJblpAsy15Yjp9fncjYO+qFFMpSyHdFjJZ5QeCnVnfzrsPSf5K5Fx0qLdbu5
	4ttbCWz7NyCiRjwohIp0RbSjlW+6VQjqj12rw8QbYM/wvMsU/QAWxrZ4GSzMPS1HNyVZ+luvcNwdG
	5WOjheOgS2U2sXJfDZX1r5iCHDZidHFWk5vlAaZKr3xNg93ODRF5av5NGfcFXgyJT+m62IpF5wIA8
	bH+Ik+qRsLilKJ3WPX6S0gh5xDCuTPiiySJVT/oEIafz6dW2SJ0wqeiFbGA1SVPJ8riM6/dRcgHM4
	BDJiqIQSuTtwhZo7F5Rc703QYIVJRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4TZn-00000005Vmv-2Xrv;
	Fri, 25 Oct 2024 23:18:39 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4TZk-00000005VmT-05tQ
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 23:18:37 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-460c0f9c13eso23358351cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729898314; x=1730503114; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yer41QwqMiWVPqbttI9QHoovSC5uzaObw4oQlNbAvps=;
        b=FYkOAm3MqTWyXUv034RiM3S4uXNNyNQwT1+4+KoZFyFNWaZOYRqyy+7r37QNCkN48G
         zGk4Hpw8UPdsH52OmyxsaxKdEZiRoKo7cdWMe0d5cTQR8LMT+3L5dTgSm3YVrXdT4ZZs
         sdMUr4dVoPKenDOjfDU6Y3lBjsVO4Q9SjxdKFQ4eOX0Tvvmmcm4144lkSpHQrUHag+uh
         mzC9X+s7vvjS4pA/pvP1RKwXWCodNEIEI0sld4KK5waVkHWA51QDwE6puHTC+Je3hn05
         iSbySzVChbsbvfJcQPn6X7v+FXpk2k3MnNqcBnzjWCAJgD+EC3ob1gmKtLQcFgxjEqgz
         ErGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729898314; x=1730503114;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yer41QwqMiWVPqbttI9QHoovSC5uzaObw4oQlNbAvps=;
        b=tYUte6wMH3MmUClnzrmWQyVu2H5d2YnRvDJ/Gb3UPodYjxuszpdYV9bRTY2dlunrL6
         exQpbGOsSreN45rS5zjBJfhCIZ6mqFRu/GHNwQt6R8eAvHVmDJhIRP5CkOlRRMA8plNR
         Xc41ZNMF0F7Hi3iSSQj19OPlXdhP1v5RTlwVEGuYKQSI/6EM17kQ5qrkZg5PSrfWsmbA
         yEBqZwVLpVWtlTJPw3XxCMBBtU02Tihc/YGyeHT+uAxyrKTHMUUvL3ep9O+5HyVoZOQ6
         iKKO2N9yGE056ddmgEA8TiNZKXc5QxXZ6yavU96zY2BNO37hTzGB7kmRA2S+/TZ/vS1D
         Bw+w==
X-Gm-Message-State: AOJu0YwP9rU23U6c9ApVr3bIaTjqoKOb5P8nv/UvSDjjGnoBvmb5DTFJ
	pPx/srpj/OAt5TSqh+z5AKOgKNX8JHoDeiNytKdkecsYh9ro8SUEkWocwgCRfiyNQJCWJOPN2bG
	gcW4y9zGcIa51r4Twhwqfw6pHzNr2SbQJ0Bo=
X-Google-Smtp-Source: AGHT+IFdGZQh6Elmgy+WW270TmtvhrfInC5CJiYtl8Oo/gqlFX9DciYh8tIejgsp9KPd3Mqp6R0T2Bu1eX6KdvePwUk=
X-Received: by 2002:a05:622a:1811:b0:458:25ec:68cf with SMTP id
 d75a77b69052e-4612527aa59mr123954951cf.13.1729898314140; Fri, 25 Oct 2024
 16:18:34 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Fri, 25 Oct 2024 16:18:23 -0700
Message-ID: <CAJ+HfNjAZcpLi11Fv0W9PMC0BCtk8-ojBhjHeA3HRxuaWmabTg@mail.gmail.com>
Subject: Call for Participation: RISC-V Devroom 2025
To: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_161836_102862_54B8FBBD 
X-CRM114-Status: UNSURE (   4.28  )
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
dGlvbiAoQ2ZQKSBmb3IgdGhlCkZPU0RFTSAyMDI1IFJJU0MtViBEZXZyb29tLiBUaGUgRGV2cm9v
bSB3aWxsIGJlIGhlbGQgb24gRmVicnVhcnkgMQooU2F0dXJkYXkpLCAyMDI1IGluIEJydXNzZWxz
LCBCZWxnaXVtLiBUaGUgc3VibWlzc2lvbiBkZWFkbGluZSBmb3IKdGFsayBwcm9wb3NhbHMgaXMg
RGVjZW1iZXIgMSwgMjAyNC4KCkZPU0RFTSBpcyBhIGZyZWUgZXZlbnQgZm9yIHNvZnR3YXJlIGRl
dmVsb3BlcnMgdG8gbWVldCwgc2hhcmUgaWRlYXMKYW5kIGNvbGxhYm9yYXRlLiBFdmVyeSB5ZWFy
LCB0aG91c2FuZHMgb2YgZGV2ZWxvcGVycyBvZiBmcmVlIGFuZCBvcGVuCnNvdXJjZSBzb2Z0d2Fy
ZSBmcm9tIGFsbCBvdmVyIHRoZSB3b3JsZCBnYXRoZXIgYXQgdGhlIGV2ZW50IGluCkJydXNzZWxz
LgoKIyBGT1NERU0gMjAyNSBSSVNDLVYgRGV2cm9vbSBDRlAKCkZPU0RFTSAyMDI1IChodHRwczov
L2Zvc2RlbS5vcmcvMjAyNS8pIHdpbGwgdGFrZSBwbGFjZSBvbiBGZWJydWFyeQoxLTIsIDIwMjUg
aW4gQnJ1c3NlbHMsIEJlbGdpdW0uIFRoZXJlIHdpbGwgYmUgYSBSSVNDLVYgZGV2ZWxvcGVy4oCZ
cwpyb29tIG9uIFNhdHVyZGF5IEZlYnJ1YXJ5IDEuCgpBbnkgdG9waWNzIHJlbGF0ZWQgdG8gUklT
Qy1WIGFyZSB3ZWxjb21lLCBidXQgdHlwaWNhbGx5IGVuY29tcGFzc2VzCnRoZSBSSVNDLVYgSVNB
LCBvcGVuIHNvdXJjZSBSSVNDLVYgaGFyZHdhcmUgKGUuZy4gY29yZXMsIFNvQ3MsCmFjY2VsZXJh
dG9ycyksIGFuZCBvcGVuIHNvdXJjZSBSSVNDLVYgc29mdHdhcmUgKGUuZy4gT1MgcG9ydHMsCmVt
dWxhdG9ycywgdG9vbGNoYWlucykuCgojIyBQcmVzZW50YXRpb24gRGV0YWlscwoKKiBUaGUgZGVm
YXVsdCBkdXJhdGlvbiBmb3IgdGFsa3Mgd2lsbCBiZSA0NSBtaW51dGVzIGluY2x1ZGluZwogIGRp
c2N1c3Npb24uIEZlZWwgZnJlZSB0byByZXF1ZXN0IGEgbG9uZ2VyIG9yIHNob3J0ZXIgc2xvdC4K
KiBQcmVzZW50YXRpb25zIHdpbGwgYmUgcmVjb3JkZWQgYW5kIHN0cmVhbWVkLiBTZW5kaW5nIHlv
dXIgcHJvcG9zYWwKICBpbXBsaWVzIGdpdmluZyBwZXJtaXNzaW9uIHRvIGhhdmUgeW91ciBwcmVz
ZW50YXRpb24gcmVjb3JkZWQgYW5kCiAgZGlzdHJpYnV0ZWQgdG9nZXRoZXIgd2l0aCB5b3VyIHNs
aWRlcyB1bmRlciBhIENyZWF0aXZlIENvbW1vbnMgQ0MtQlkKICBsaWNlbnNlLgoKIyMgU3VibWl0
IGEgdGFsawoKSGVhZCB0byB0aGUgRk9TREVNIDIwMjUgcHJldGFseAooaHR0cHM6Ly9wcmV0YWx4
LmZvc2RlbS5vcmcvZm9zZGVtLTIwMjUvY2ZwKSB3ZWJzaXRlLgoKKiBUaGUgdGl0bGUgYW5kIHN1
YnRpdGxlIG9mIHlvdXIgdGFsayAocGxlYXNlIGJlIGRlc2NyaXB0aXZlLCBhcwogIHRpdGxlcyB3
aWxsIGJlIGxpc3RlZCB3aXRoIH41MDAgZnJvbSBvdGhlciBwcm9qZWN0cykKKiBTZWxlY3QgIlJJ
U0MtViBEZXZyb29tIiBhcyB0aGUgdHJhY2suCiogQSBzaG9ydCBhYnN0cmFjdCBvZiBvbmUgcGFy
YWdyYXBoCiogQSBsb25nZXIgZGVzY3JpcHRpb24gaWYgeW91IHdpc2ggdG8gZG8gc28KKiBBIHNo
b3J0IGJpbyBhbmQgY29udGFjdCBpbmZvcm1hdGlvbgoqIExpbmtzIHRvIHJlbGF0ZWQgd2Vic2l0
ZXMgLyBibG9ncyBldGMuCiogVGFsayBkdXJhdGlvbgoKIyMgSW1wb3J0YW50IERhdGVzCgoqIERl
Y2VtYmVyIDEsIDIwMjQ6IFN1Ym1pc3Npb24gZGVhZGxpbmUgZm9yIHRhbGsgcHJvcG9zYWxzCiog
RGVjZW1iZXIgMTUsIDIwMjQ6IEFubm91bmNlbWVudCBvZiB0aGUgZmluYWwgc2NoZWR1bGUKKiBG
ZWJydWFyeSAxIChTYXR1cmRheSksIDIwMjU6IFJJU0MtViBEZXZyb29tCgojIFZvbHVudGVlcmlu
ZwoKRk9TREVNIG5lZWRzIHlvdSEgRXZlcnkgeWVhciwgdGhlIEZPU0RFTSB0ZWFtIGlzIGFzc2lz
dGVkIGJ5IGFuCmVudGh1c2lhc3RpYyB0ZWFtIG9mIHZvbHVudGVlcnMgdG8gaGVscCBvdXQgd2l0
aCB2YXJpb3VzIHRhc2tzIGFuZAptYWtlIHRoZSBldmVudCBhIGZ1biBhbmQgc2FmZSBwbGFjZSBm
b3IgYWxsIG91ciB2aXNpdG9ycy4KClRoZXJlIGFyZSBzb21lIGJlbmVmaXRzIHRvIGJlaW5nIGEg
dm9sdW50ZWVyLCBidXQgbW9zdCBpbXBvcnRhbnRseSB5b3UKaGVscCBtYWtlIEZPU0RFTSBwb3Nz
aWJsZSEKClZpc2l0IGh0dHBzOi8vdm9sdW50ZWVycy5mb3NkZW0ub3JnLyB0byBzaWduIHVwLgoK
CkNoZWVycywKQmrDtnJuIFTDtnBlbCAoYmpvcm4udG9wZWxAZ21haWwuY29tKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
