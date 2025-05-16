Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5D3C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+xqNxzKwlviStrmucaZIKHek+q2oRyORTGwQhnS8tlc=; b=23e4XU/o5QpDib
	pPNAhzIwbfWtL6FpGl51PHIwzLv9cEjZuqvSGGqqA+Kna9VN228FwNJej7eXSvE1ndAzMAPbcTrMl
	b0wlPyYQHxtmmxIE2JGEIKSIGhwesdNH7b7yUAkRqa2Jv3gIdP5Ry0Mbxzk1tinlaoEQrxWYFYJ36
	Q/W8xLW+6SrbHo4MoNkb9OwttKf0CELdLX9eZFgFFUBG0nZWvap8Du3RPF4TYvWW6MxCgPK1/ZqWh
	utgnnlD0sFAjwYL9xOyJrW/2MX2zDlxI0CTQ/3QdEl65ECJ1sMQzs2zLnAekXrGKQ91oIHC2e72BA
	xV2RZydqZWS2WUw1JYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQB-00000003vAe-2DBF;
	Fri, 16 May 2025 15:56:27 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwv7-00000003qCd-4BEW
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 15:24:23 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7302a769534so1861985a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747409061; x=1748013861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DtOqMVpDb5beeKTmS57Q+DqCN66UUqR4O4lRAPl/Pjc=;
        b=Z/Ke4th5lEFMb7/RcXD5yoeGlOpEZOb4mJv/1Az4BrJFvwU7JqZOK2iHPhzOA1FkHW
         LfQApDUbnUQK9qBlCyxxIlDD9sPyrs8BqY8Z1cVDHBzaZxiASjUE8BsAurNZ2ozSrsuM
         t0++wsEzoahJ2oP0CFR44BvKdJxBISssKBLKyozOQcrnw6Pco4QKvgqGefiyRdcUVac8
         n5xZi9LfVSzkXM252HcxmPGnOljRdqWqUCURnBoXbtonvPyzq2Ar1VomFO+3yvuB6OJl
         Ah8HojieyA6dkEPlyvQzQu6pESy3J4p/HHxHcAaS6SeNKhekBDaeTJXJDssCmmuhmPld
         Y5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409061; x=1748013861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtOqMVpDb5beeKTmS57Q+DqCN66UUqR4O4lRAPl/Pjc=;
        b=XBWUid+pm0vhV3WdHVnVloxB9vylviMB0UZY5nHFBNRJH7pM7Fzx/9r+h+kMH5IP01
         ZY0ouu3FoCn5H8g5BtdZj1MJ+sEnBX+mNg3XoDskEr9xxtS7a5g0CZmlGQC7cz250bTM
         c0/MCEEQ4zNuDwiboYrdV324COmybWyTIAJ6obvnqgXARB+7oB8vG0rR2ZmgX00zoPEy
         eVan64d8kdx10J4M1rd+t5q7jmfSalA5VADs2TxzH+Kt92QKODdowcUToRfl0TXHr/N9
         ZCXJyGU4IPZ+TuGXUqSIUIQatdvWB8muPwDyYu6nbO3q1UKdXlt3jUHiz0xHshQNXh70
         OkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4gA0V+fl+HAabUR2ENkfKzpuX3oO+W3smaDk0W3J1YE5IgYrpDsRO0OLqL/24R66RKDYsAEq7vtHQTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY7JWtpuhqvLhV3VEUR1EJpNW5/z1MoRgEEC2TIJBDE2dOAPZV
	1kJ7Sl1CxlugxC9sbZ8R+ULMESI4D1qUjFW+BzuIBp4/g3Qf/wN2zo2iWRyAa6FPR4JU3bqCVTD
	VnBRPTGA=
X-Gm-Gg: ASbGncsYitrRP4T6k4bzX17hxrLObwbIgpY3OCYdKdKlnqDcwgFUkkUD/sVeFjuzSTM
	qRZFC3e/sdFm7/WJCLnHT2XIUks7bx4Gh6bfbLmL99TN3vsVv45b5W2TbSxsQww1K+p4fm0lSf7
	hOr5JSB+Hxs9Pnat1yab+ogtsGec7iSqDi9fxVl2c60gFOUJipLHYDt9hsqtuZmAk6ZKryXKH9a
	DDsgpPY+Hg82Zdm70bTv9VF7JC4Q6HmW0V2IUT9xwU+q4XD8qgRVHf5qytzAmISq5Xy6Hi3E7FQ
	waRbQU1+Tqi+yCu2a77gVMbpUmKO9BKo81XQDWZtW94nlxx7ZvhM
X-Google-Smtp-Source: AGHT+IExb77aBo1LIezbIdH98oPYn1SbELTTVMkD5q9whj7vlwOG/qOpu/YD++YYt08LeDhnPFn1Zw==
X-Received: by 2002:a05:6a00:894:b0:740:a921:f6de with SMTP id d2e1a72fcca58-742a98e9c0cmr4813351b3a.23.1747409050021;
        Fri, 16 May 2025 08:24:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def68sm1666997b3a.30.2025.05.16.08.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:24:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v4 0/4] riscv: add support for SBI Supervisor Software Events
Date: Fri, 16 May 2025 17:23:38 +0200
Message-ID: <20250516152355.560448-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_082422_037970_95E493CF 
X-CRM114-Status: GOOD (  24.83  )
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

VGhlIFNCSSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyAoU1NFKSBleHRlbnNpb25zIHByb3Zp
ZGVzIGEgbWVjaGFuaXNtCnRvIGluamVjdCBzb2Z0d2FyZSBldmVudHMgZnJvbSBhbiBTQkkgaW1w
bGVtZW50YXRpb24gdG8gc3VwZXJ2aXNvcgpzb2Z0d2FyZSBzdWNoIHRoYXQgaXQgcHJlZW1wdHMg
YWxsIG90aGVyIHN1cGVydmlzb3IgbGV2ZWwgdHJhcHMgYW5kCmludGVycnVwdHMuIFRoaXMgZXh0
ZW5zaW9uIGlzIGludHJvZHVjZWQgYnkgdGhlIFNCSSB2My4wIHNwZWNpZmljYXRpb25bMV0uCgpW
YXJpb3VzIGV2ZW50cyBhcmUgZGVmaW5lZCBhbmQgY2FuIGJlIHNlbmQgYXN5bmNocm9ub3VzbHkg
dG8gc3VwZXJ2aXNvcgpzb2Z0d2FyZSAoUkFTLCBQTVUsIERFQlVHLCBBc3luY2hyb25vdXMgcGFn
ZSBmYXVsdCkgZnJvbSBTQkkgYXMgd2VsbAphcyBwbGF0Zm9ybSBzcGVjaWZpYyBldmVudHMuIEV2
ZW50cyBjYW4gYmUgZWl0aGVyIGxvY2FsIChwZXItaGFydCkgb3IKZ2xvYmFsLiBFdmVudHMgY2Fu
IGJlIG5lc3RlZCBvbiB0b3Agb2YgZWFjaCBvdGhlciBiYXNlZCBvbiBwcmlvcml0eSBhbmQKY2Fu
IGludGVycnVwdCB0aGUga2VybmVsIGF0IGFueSB0aW1lLgoKRmlyc3QgcGF0Y2ggYWRkcyB0aGUg
U1NFIGRlZmluaXRpb25zLiBTZWNvbmQgb25lIGFkZHMgc3VwcG9ydCBmb3IgU1NFCmF0IGFyY2gg
bGV2ZWwgKGVudHJ5IGNvZGUgYW5kIHN0YWNrIGFsbG9jYXRpb25zKSBhbmQgdGhpcmQgb25lIGF0
IGRyaXZlcgpsZXZlbC4gRmluYWxseSwgdGhlIGxhc3QgcGF0Y2ggYWRkIHN1cHBvcnQgZm9yIFNT
RSBldmVudHMgaW4gdGhlIFNCSSBQTVUKZHJpdmVyLiBBZGRpdGlvbmFsIHRlc3RpbmcgZm9yIHRo
YXQgcGFydCBpcyBoaWdobHkgd2VsY29tZWQgc2luY2UgdGhlcmUKYXJlIGEgbG90IG9mIHBvc3Np
YmxlIHBhdGggdGhhdCBuZWVkcyB0byBiZSBleGVyY2lzZWQuCgpBbW9uZ3N0IHRoZSBzcGVjaWZp
YyBwb2ludHMgdGhhdCBuZWVkcyB0byBiZSBoYW5kbGUgaXMgdGhlIGludGVycnVwdGlvbgphdCBh
bnkgcG9pbnQgb2YgdGhlIGtlcm5lbCBleGVjdXRpb24gYW5kIG1vcmUgc3BlY2lmaWNhbGx5IGF0
IHRoZQpiZWdpbm5pbmcgb2YgZXhjZXB0aW9uIGhhbmRsaW5nLiBEdWUgdG8gdGhlIGZhY3QgdGhh
dCB0aGUgZXhjZXB0aW9uIGVudHJ5CmltcGxlbWVudGF0aW9uIHVzZXMgdGhlIFNDUkFUQ0ggQ1NS
IGFzIGJvdGggdGhlIGN1cnJlbnQgdGFzayBzdHJ1Y3QgYW5kCmFzIHRoZSB0ZW1wb3JhcnkgcmVn
aXN0ZXIgdG8gc3dpdGNoIHRoZSBzdGFjayBhbmQgc2F2ZSByZWdpc3RlciwgaXQgaXMKZGlmZmlj
dWx0IHRvIHJlbGlhYmx5IGdldCB0aGUgY3VycmVudCB0YXNrIHN0cnVjdCBpZiB3ZSBnZXQgaW50
ZXJydXB0ZWQKYXQgdGhpcyBzcGVjaWZpYyBtb21lbnQgKGllLCBpdCBtaWdodCBjb250YWluIDAs
IHRoZSB0YXNrIHBvaW50ZXIgb3IgdHApLgpBIGZpeHVwLWxpa2UgbWVjaGFuaXNtIGlzIG5vdCBw
b3NzaWJsZSBkdWUgdG8gdGhlIG5lc3RlZCBuYXR1cmUgb2YgU1NFCndoaWNoIG1ha2VzIGl0IHJl
YWxseSBoYXJkIHRvIG9idGFpbiB0aGUgb3JpZ2luYWwgaW50ZXJydXB0aW9uIHNpdGUuIEluCm9y
ZGVyIHRvIHJldHJpZXZlIHRoZSB0YXNrIGluIGEgcmVsaWFibGUgbWFubmVyLCBhZGQgYW4gYWRk
aXRpb25hbApfX3NzZV9lbnRyeV90YXNrIHBlcl9jcHUgYXJyYXkgd2hpY2ggc3RvcmVzIHRoZSBj
dXJyZW50IHRhc2suIElkZWFsbHksCndlIHdvdWxkIG5lZWQgdG8gbW9kaWZ5IHRoZSB3YXkgd2Ug
cmV0cmlldmUvc3RvcmUgdGhlIGN1cnJlbnQgdGFzayBpbgpleGNlcHRpb24gaGFuZGxpbmcgc28g
dGhhdCBpdCBkb2VzIG5vdCBkZXBlbmQgb24gdGhlIHBsYWNlIHdoZXJlIGl0J3MKaW50ZXJydXB0
ZWQuCgpDb250cmFyeSB0byBwc2V1ZG8gTk1JIFsyXSwgU1NFIGRvZXMgbm90IG1vZGlmaWVzIHRo
ZSB3YXkgaW50ZXJydXB0cyBhcmUKaGFuZGxlZCBhbmQgZG9lcyBub3QgYWRkcyBhbnkgb3Zlcmhl
YWQgdG8gZXhpc3RpbmcgY29kZS4gTW9yZW92ZXIsIGl0CnByb3ZpZGVzICJ0cnVlIiBOTUktbGlr
ZSBpbnRlcnJ1cHRzIHdoaWNoIGNhbiBpbnRlcnJ1cHQgdGhlIGtlcm5lbCBhdAphbnkgdGltZSAo
ZXZlbiBpbiBleGNlcHRpb24gaGFuZGxpbmcpLiBUaGlzIGlzIHBhcnRpY3VsYXJseSBjcnVjaWFs
IGZvcgpSQVMgZXJyb3JzIHdoaWNoIG5lZWRzIHRvIGJlIGhhbmRsZWQgYXMgZmFzdCBhcyBwb3Nz
aWJsZSB0byBhdm9pZCBhbnkKZmF1bHQgcHJvcGFnYXRpb24uCgpXaGlsZSBPcGVuU0JJIFNTRSBz
dXBwb3J0IGlzIGFscmVhZHkgdXBzdHJlYW0sIGFuIGFkZGl0aW9uYWwgcGF0Y2ggaXMKbmVlZGVk
IGZvciB0aGUgUE1VIHBlcmYgZHJpdmVyIHRvIHdvcmsgYXMgZXhwZWN0ZWQgWzJdLgoKTGluazog
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9yZWxlYXNlcy9k
b3dubG9hZC92My4wLXJjNy9yaXNjdi1zYmkucGRmIFsxXQpMaW5rOiBodHRwczovL2dpdGh1Yi5j
b20vcml2b3NpbmMvb3BlbnNiaS90cmVlL2Rldi9jbGVnZXIvc3NlX3BtdV9pcnEgWzJdCgotLS0K
CkNoYW5nZXMgaW4gdjQ6CiAtIEZpeCBhIGJ1ZyB3aGVuIHVzaW5nIHBlcl9jcHUgcHRyIGZvciBs
b2NhbCBldmVudCAoQW5kcmV3KQogLSBBZGQgc3NlX2V2ZW50X2Rpc2FibGUvZW5hYmxlX2xvY2Fs
KCkKIC0gQWRkIHBtdV9kaXNhYmxlL3BtdV9lbmFibGUoKSB0byBkaXNhYmxlL2VuYWJsZSBTU0Ug
ZXZlbnQKIC0gVXBkYXRlIGV2ZW50IElEIGRlc2NyaXB0aW9uIGFjY29yZGluZyB0byB0aGUgbGF0
ZXN0IHNwZWMKIC0gRml4IGNvbW1lbnQgYWJvdXQgYXJndW1lbnRzIGluIGhhbmRsZV9zc2UoKQog
LSBBZGRlZCBIaW1hbmNodSBhcyBhIFNTRSByZXZpZXdlcgogLSBVc2VkIFNZTV9EQVRBXyooKSBt
YWNyb3MgaW5zdGVhZCBvZiBoYXJkY29kZWQgbGFiZWxzCiAtIEludm9rZSBzb2Z0aXJxcyBvbmx5
IGlmIG5vdCByZXR1cm5pbmcgdG8ga2VybmVsIHdpdGggaXJxcyBkaXNhYmxlZAogLSBSZW1vdmUg
aW52YWxpZCBzdGF0ZSBjaGVjayBmb3Igd3JpdGUgYXR0cmlidXRlIGZ1bmN0aW9uLgogLSBSZW1v
dmUgdXNlbGVzcyBibmVxIHN0YXRlbWVudCBpbiBzc2VfZW50cnkuUwoKQ2hhbmdlcyBpbiB2MzoK
IC0gU3BsaXQgYXJjaC9kcml2ZXIgc3VwcG9ydAogLSBGaXggcG90ZW50aWFsIHJlZ2lzdGVyIGZh
aWx1cmUgcmVwb3J0aW5nCiAtIFNldCBhIGZldyBwcl9lcnIgYXMgcHJfZGVidWcKIC0gQWxsb3cg
Q09ORklHX1JJU0NWX1NTRSB0byBiZSBkaXNhYmxlZAogLSBGaXggYnVpbGQgd2l0aG91dCBDT05G
SUdfUklTQ1ZfU1NFCiAtIFJlbW92ZSBmaXh1cC1saWtlIG1lY2hhbmlzbSBhbmQgdXNlIGEgcGVy
LWNwdSBhcnJheQogLSBGaXhlZCBTU0NSQVRDSCBiZWluZyBjb3JydXB0ZWQgd2hlbiBpbnRlcnJ1
cHRpbmcgdGhlIGtlcm5lbCBpbiBlYXJseQogICBleGNlcHRpb24gcGF0aC4KIC0gU3BsaXQgU1NF
IGFzc2VtYmx5IGZyb20gZW50cnkuUwogLSBBZGQgSGltYW5jaHUgU1NFIG1hc2svdW5tYXNrIGFu
ZCBydW50aW1lIFBNIHN1cHBvcnQuCiAtIERpc2FibGUgdXNlciBtZW1vcnkgYWNjZXNzL2Zsb2F0
aW5nIHBvaW50L3ZlY3RvciBpbiBTU0UgaGFuZGxlcgogLSBSZWJhc2VkIG9uIG1hc3RlcgoKdjI6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwMTEyMTExNzIwLjI5NzUw
NjktMS1jbGVnZXJAcml2b3NpbmMuY29tLwoKQ2hhbmdlcyBpbiB2MjoKIC0gSW1wbGVtZW50ZWQg
c3BlY2lmaWNhdGlvbiB2MgogLSBGaXggdmFyaW91cyBlcnJvciBoYW5kbGluZyBjYXNlcwogLSBB
ZGRlZCBzaGFkb3cgc3RhY2sgc3VwcG9ydAoKdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjMxMDI2MTQzMTIyLjI3OTQzNy0xLWNsZWdlckByaXZvc2luYy5jb20vCgpD
bMOpbWVudCBMw6lnZXIgKDQpOgogIHJpc2N2OiBhZGQgU0JJIFNTRSBleHRlbnNpb24gZGVmaW5p
dGlvbnMKICByaXNjdjogYWRkIHN1cHBvcnQgZm9yIFNCSSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2
ZW50cyBleHRlbnNpb24KICBkcml2ZXJzOiBmaXJtd2FyZTogYWRkIHJpc2N2IFNTRSBzdXBwb3J0
CiAgcGVyZjogUklTQy1WOiBhZGQgc3VwcG9ydCBmb3IgU1NFIGV2ZW50CgogTUFJTlRBSU5FUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE1ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
YXNtLmggICAgICAgICB8ICAxNCArLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCAgICAg
ICAgIHwgIDY1ICsrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zY3MuaCAgICAgICAgIHwgICA3
ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3NlLmggICAgICAgICB8ICA0NSArKwogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCAgIHwgIDE0ICsKIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdGhyZWFkX2luZm8uaCB8ICAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAg
ICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyAgICAgIHwg
IDEyICsKIGFyY2gvcmlzY3Yva2VybmVsL3NzZS5jICAgICAgICAgICAgICB8IDEzMiArKysrKwog
YXJjaC9yaXNjdi9rZXJuZWwvc3NlX2VudHJ5LlMgICAgICAgIHwgMTY5ICsrKysrKysKIGRyaXZl
cnMvZmlybXdhcmUvS2NvbmZpZyAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2Zpcm13YXJl
L01ha2VmaWxlICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29u
ZmlnICAgICAgIHwgIDE1ICsKIGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUgICAgICB8
ICAgMyArCiBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NzZS5jICAgfCA2OTYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3BlcmYvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgfCAgIDkgKwogZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jICAgICAgICAgICAgIHwgIDE5ICsK
IGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgICAgICAgICB8ICA3MiArKy0KIGluY2x1ZGUv
bGludXgvcGVyZi9yaXNjdl9wbXUuaCAgICAgICB8ICAgMyArCiBpbmNsdWRlL2xpbnV4L3Jpc2N2
X3NzZS5oICAgICAgICAgICAgfCAgNTkgKysrCiAyMSBmaWxlcyBjaGFuZ2VkLCAxMzQwIGluc2Vy
dGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc3NlLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9z
c2UuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3NzZV9lbnRyeS5TCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnCiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvcmlzY3Zfc3NlLmMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBpbmNsdWRlL2xpbnV4L3Jpc2N2X3NzZS5oCgotLSAKMi40OS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
