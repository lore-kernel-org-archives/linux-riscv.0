Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A63E606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4dNpvslx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MFSHjBm+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R+hmtV0MGoE9Gr/n5++wx0CLsyljAmkcG6vA4k3LTaM=; b=4dNpvslxXusNcCHbr26d/zAvpE
	4w/1K/VzlZv7z7lfGnW6DNAhZ3iwjXgxo1YOS6x+g4WQqsRFvrVl/9LAN6tr5Gk9q6kZHpbk4pmGO
	uJm4h02sqPfNCa3eofx+H/ZhXTKeACMfgAVE/3EHxEM/RoynaXUvB1QCQPvMIpSPrwAvHCyw5+EUu
	Y0xs/TiyYM7Yilt21NnP1v2iuu4TSj3h/Oc4vzMia+odCLsWcuwKCqgft8hDD7102yAICwILSUVhB
	bZap0pY2Xp7Ynz9cyC/MOzphElHQSvLCSG+r0k23B9dcuORjzZN7KN7k4K+PaKRA4HxKa8vtqSzIa
	wfO9zH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSn-0000000BZEs-0udW;
	Wed, 25 Nov 2026 23:31:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSj-0000000BZ85-0ujx
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:31:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4a42b34e930so5542416f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649499; x=1796254299; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKnAC/v/PE5Id4vZjvScRbgOEIeYezkg5HQc5ebkHqc=;
        b=MFSHjBm+xZjdzGsz7eJXF/Sh7nXC+MqCe/thasNLPYKBS697DzoIdFriiu9q4sIwZ5
         EJkF2vzn5jNRCx0AdoLoOYy1hOgr/XmqBPFyMfXklGGypqLQLvEVkvBQHtB7k9xfVM+y
         o/LWJGNRPL7eCEtj2wBP+j6HSfr7IWY5DzK9Lvj3WOxJ+OzHb7oXWCG7ucQAl2PDsbob
         Xz3JSsHpmBGDENuEIsBd+0GivAofJye+JhCX7/Nns/lzLT5XGXKlZK5djrDzP64HMUGX
         9wt/8dQNuWqW2PplpgTuiBsCMb0VjDtTGnkHil9QY4Fsv2RJkxXXErg34Sk1IId6T7Cp
         Bk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649499; x=1796254299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKnAC/v/PE5Id4vZjvScRbgOEIeYezkg5HQc5ebkHqc=;
        b=ZSNx2ihZiyARLguWf1MQq6kCUtz6hDonDzPYEfIA/yC/u7PJdzIl1jrhOmLWE5Sy+r
         57P6cZK4+D/3luLRnT0pfBVRey6OmORuasHyHPmkQ7Ns/RLojFQD9Gp0vwU0M9IHud4U
         NFRWqhKvXZFEVFFwaQCsxOl7DOA8uvqgxg5ft2sjOjaccXMJI2jF/pJqJBIAWGyYN1PS
         p2djRIjBClvd/eEA5vBexoFVvZY8BnamGsZquVw/pk+wMvvz8UPRWDUYRMIfMUK2ZaA+
         IKhPSZe7BHWWeE04EKiv88SUNCbxjIskRw+pYMcM0rZHw19qRMgSIZupf8zdryQeLhoJ
         9wWQ==
X-Gm-Message-State: APuU4Z9j5f65ttO61Rp9sO1m5YFLv0uvdjeQ7OZ3mIJJJpeBx2N78CaI
	9zOIBEOx+l+7wdqbg5wH6oAbQEKaxa06pVH13Zxi0RONxocaoaSom/zc67wgXbh4Bdk=
X-Gm-Gg: AZFdTZcNEE4nwbciGKrQnUYoCbc8XQsxZPalYitCKgtvkhagSgEp2X+0imOx4utjssT
	qZqjg9jktqqLls/3HcPO4qomoWuCADLK/Z1fSw1z3Ga31HYNUUfN8fxx96a+AGrt+NXvAvXKBAl
	47Qb4Fx+gdvj/ZTUPnZFN3nR53pyijyep+eb14GbIkl19PWC6L02dopaGg04Q6oAjJ7LNzk6maB
	6eEHw1OPRB6JoldL1RG/c44ooiCvrqKbhMtm8qpYkpV2/2EPyYzUXNFrFFwdggGpEZ5c2Yxzbr1
	x9pJss4QxvmJEuMHg4RNeViMZJu/JVOEv+IUo9BddBAYTplHOU8PdToZ9KCHZmYsti/jQ0T8UNY
	QVoPOfMCtmkwukOodALmRaz/VHHfOFnU9OqD/SdSDm0GnzJpsFFhUvqtqoFTJPheMxh+uggQdVw
	5CbldE7otqpMQzg45RTZSfnu4unI9gheByQbiU/A21mGSfxAUOEnBLfkSk+Cp6unanDWvKZ5too
	+Fx2BNbr4CGmudv3rQKtVr0yGzY6Anmo2JQKOAf0eWetfyQHl9XNDNgQaxhjS2aU/+4EDULxLIv
	FN9dbBCMvw4zywjXZwDfk7BWqgualGxJv1w7bRdcLQiTpV69IDAd6Mtqzh1Sty2Wus4q91+IUAt
	06hN+C/7Puw==
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr27523078f8f.5.1795649499471;
        Wed, 25 Nov 2026 15:31:39 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm38590936f8f.8.2026.11.25.15.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:39 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Subject: [PATCH RFC 12/19] serial: esp32: Rearm TX interrupts when the FIFO is full
Date: Wed, 25 Nov 2026 23:30:13 +0000
Message-ID: <20261125233020.1380594-13-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153141_313254_7A7BF61B 
X-CRM114-Status: GOOD (  13.36  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V2hlbiB0cmFuc21pc3Npb24gc3RhcnRzIHdpdGggYSBmdWxsIEZJRk8sIHRoZSBkcml2ZXIgY2Fu
IGxlYXZlCnF1ZXVlZCBkYXRhIHdhaXRpbmcgd2l0aCB0aGUgVFggaW50ZXJydXB0IGRpc2FibGVk
LiBSZWFybSB0aGUKaW50ZXJydXB0IHdoZW5ldmVyIHRoZXJlIGlzIGRhdGEgcmVhZHkgdG8gc2Vu
ZCwgaW5jbHVkaW5nIGEgcGVuZGluZwpoaWdoLXByaW9yaXR5IGNoYXJhY3Rlci4KCkhvbGQgdGhl
IHBvcnQgbG9jayBpbiB0aGUgVFggaW50ZXJydXB0IGhhbmRsZXIgYXMgcmVxdWlyZWQgYnkKdWFy
dF9wb3J0X3R4X2xpbWl0ZWQoKS4KClRlc3RlZCBvbiBhIFdhdmVzaGFyZSBFU1AzMi1QNC1Nb2R1
bGUtREVWLUtJVC4gVmVyaWZpZWQgdGhhdCBzZXJpYWwKb3V0cHV0IGNvbXBsZXRlZCBkdXJpbmcg
U0RNTUMgcmVhZHMuCgpBSSBhc3Npc3RlZCB3aXRoIGRyaXZlciBkZXZlbG9wbWVudC4KClNpZ25l
ZC1vZmYtYnk6IFbDrXRvciBIdWdvIFNpbHZhIDx2aXRvcmhnMjAwODBAZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMgfCAxMiArKysrKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy90dHkvc2VyaWFsL2VzcDMyX3VhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9lc3Az
Ml91YXJ0LmMKaW5kZXggMzA0ZTEzNDU1MThiLi4wMDJkNmZkYmQ4NzUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMKKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL2Vz
cDMyX3VhcnQuYwpAQCAtMzU0LDE0ICszNTQsMTQgQEAgc3RhdGljIHZvaWQgZXNwMzJfdWFydF90
cmFuc21pdF9idWZmZXIoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCkKIAl1bnNpZ25lZCBpbnQgcGVu
ZGluZzsKIAl1OCBjaDsKIAotCWlmICh0eF9maWZvX3VzZWQgPj0gRVNQMzJfVUFSVF9UWF9GSUZP
X1NJWkUpCi0JCXJldHVybjsKLQorCXR4X2ZpZm9fdXNlZCA9IG1pbl90KHUzMiwgdHhfZmlmb191
c2VkLCBFU1AzMl9VQVJUX1RYX0ZJRk9fU0laRSk7CiAJcGVuZGluZyA9IHVhcnRfcG9ydF90eF9s
aW1pdGVkKHBvcnQsIGNoLAogCQkJCSAgICAgICBFU1AzMl9VQVJUX1RYX0ZJRk9fU0laRSAtIHR4
X2ZpZm9fdXNlZCwKIAkJCQkgICAgICAgdHJ1ZSwgZXNwMzJfdWFydF9wdXRfY2hhcihwb3J0LCBj
aCksCiAJCQkJICAgICAgICh7fSkpOwotCWlmIChwZW5kaW5nKSB7CisKKwkvKiBSZWFybSBUWCBl
dmVuIGlmIHRoZSBGSUZPIGhhZCBubyByb29tIGZvciBxdWV1ZWQgZGF0YS4gKi8KKwlpZiAocG9y
dC0+eF9jaGFyIHx8IChwZW5kaW5nICYmICF1YXJ0X3R4X3N0b3BwZWQocG9ydCkpKSB7CiAJCXUz
MiBpbnRfZW5hOwogCiAJCWludF9lbmEgPSBlc3AzMl91YXJ0X3JlYWQocG9ydCwgVUFSVF9JTlRf
RU5BX1JFRyk7CkBAIC0zNzIsNyArMzcyLDExIEBAIHN0YXRpYyB2b2lkIGVzcDMyX3VhcnRfdHJh
bnNtaXRfYnVmZmVyKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCiAKIHN0YXRpYyB2b2lkIGVzcDMy
X3VhcnRfdHhpbnQoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCkKIHsKKwl1bnNpZ25lZCBsb25nIGZs
YWdzOworCisJdWFydF9wb3J0X2xvY2tfaXJxc2F2ZShwb3J0LCAmZmxhZ3MpOwogCWVzcDMyX3Vh
cnRfdHJhbnNtaXRfYnVmZmVyKHBvcnQpOworCXVhcnRfcG9ydF91bmxvY2tfaXJxcmVzdG9yZShw
b3J0LCBmbGFncyk7CiB9CiAKIHN0YXRpYyBpcnFyZXR1cm5fdCBlc3AzMl91YXJ0X2ludChpbnQg
aXJxLCB2b2lkICpkZXZfaWQpCi0tIAoyLjU2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
