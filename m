Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB8606A339
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Axc30K3o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWW7rPfo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z4g0XfuDFI1sVQb5tjk2dKpWtWST3E9ZvWFi+U5edLM=; b=Axc30K3ogQViSqVfpcj0NwGibm
	Psz0ZdDUx4mIWSw14XM5rQqjeewROeJW5/5j2kCqApS5KySxd0U+s9SRGhZsf+7sP4ufhS/uLE1Pe
	siEHTFeyT6AQoULa644O+96LUG2FAGYQ8lgewdhURYXg5+KZVO2Q0TuTVIdA41shLEVPlPHFOo5Ak
	hCXaW+QEpzqKnDbvlboAYGpzZowvUqvBLfOg+EoHRgOJqyCnht23WrK1FRRVbJhEiRZbQmV/aEoEL
	n1PzOLRILvq72i9ivOmm52KDbrKp+T4DBJqBHE+p5Grt2MAK4/CB2wrAKMvLRo9fAOGoIaeltfvC6
	bnI27NHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSE-0000000BYeB-1uEt;
	Wed, 25 Nov 2026 23:31:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSC-0000000BYb5-0imx
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:31:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3711693f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649466; x=1796254266; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jE8tLg0LupH7ClQVfxPt5vWJCv8YBby0udaIwTLsjng=;
        b=aWW7rPfoypBK1B53ltubc5OBdvNKWhdOvTmbLGbKbRd6m9M7x4116l4D5d2gGEysR7
         DnEh9zsvX/IiHKDmrYfRzvOm0SYol1sc5a1aUTmgpNtV/MgG2Rwj+DXtOW1sS/MwWax/
         J8a/qEKOe2SxB+bTChmPW+DLs17pf16bmZM93FwzlrOmLLNo3pVrLH9Nylx9qnanbeY1
         SbKbFxCfup//1P7qowlexo4tpBbV5D6Hr4fRfS6AF8cD0ItT/qO9t+pmgf4YnMxPjlod
         UG8C8PUy9nZJGo9KXoqPFz5bj2ZmB+lTGpU9rA4SUjff3PA9wdl3U6IvT0TPnlaDn7vO
         N4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649466; x=1796254266;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jE8tLg0LupH7ClQVfxPt5vWJCv8YBby0udaIwTLsjng=;
        b=hZGwdZC3wvvvxFXr7hVu0eS2iNo8yDp85uNWnzk+sDAJh2HOyEK01+pBykr+KGxZ8k
         +bzD+L7oJz3vMPa37ndZgwOGmY435dVa8zSvsGv9Qvz4Eu4UpR8IIgchrPP9Xm0nVzr3
         LBMkBn4DIOKNb/5XiqQ9TBfQp7EEeogprmzDEpNY0lMdsQP/S1TVKfDRp8jkS4B4Psl5
         iSRRKYlg+JH41zE1WV60/hyI4pMLVwBzm/bn8bBjly3XbfavhV3q28Hvs66o6ELi5AIK
         q4DuZMokYEx75HHbXLQr0BcmbJkU75TCtZUfEFFGB84UQodxooKOLQV04zJiBWNcks+P
         fMfQ==
X-Gm-Message-State: APuU4Z9eVH1O7u8b6Kq2Sl8cEOdMyKfnKVgf+zvbApvZRT54qvV5WriB
	Rve4/62Ag92kIYbF837SfU/68HKcwkzZtw+FEPx4jHHEHtIwZmOUs7k15SnhLKxGKUY=
X-Gm-Gg: AZFdTZc8WhjTxGcOXcZpIp8soyLOpM/XVuLBFL0/oEHN28MohhrFwU2icokA0ESP7w1
	xD7rz071ZxhPgyO+zc3ACagWpyyeRLIrKH2D6HRpwjAvN3M0rl3rPQcXTbqDEcb06qzWBJbRTjN
	IAceoL0phNoENae+wQuDorm6aRl8dN646vNOK4Zd5B35w+873pl8Bt4/32ZKo+ul5Kd3lVA3D6u
	Nw4vhOLnYoKSyvM6oJFWEeOFXRAARqkddr60XeVyPi56aDObm3h+9CpnLJGpJZJtD7fIipGei55
	m+cHTtM2b5EjHHFmE3laXdJgMbzRPl6M/y/nur631ckqIMaXBjuJCrKfOyKc8KfFZVTJrt8MytE
	v4RpOo0xPO+JSIf6u7CYVqDQ5Hi3T6iVtyxX9I2Gq1EOcYwt9GDx8y8crwAVhY9/KBkP5bAxWWt
	5qQCkdOvyMNILdC9ZMEY2Kjbq62nYUvUnz6/titn5msS/lIjyDKGCe6QS2UUxT1l2PnS+XLOM92
	d9t6F8CyqXnyjr/sErCt3Tb3m0uwKdbSSyEv0nOObdNPC+btwoY16//sEQDF1UvbQCh3fb/0Bpg
	kQTqwNkyhkpP8I9nrsQlrjci3AwLGR9Q2/okxFQKJ9oeSuZP+SKttdzEDSav+zRp/kMKeUps/FU
	ri2QSsDjvBQ==
X-Received: by 2002:a05:6000:4381:b0:4a6:5a2a:f5a3 with SMTP id ffacd0b85a97d-4abaa9773abmr40228173f8f.3.1795649466298;
        Wed, 25 Nov 2026 15:31:06 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm44084859f8f.21.2026.11.25.15.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:06 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH RFC 08/19] clocksource/drivers/timer-clint: Add Espressif ESP32-P4 support
Date: Wed, 25 Nov 2026 23:30:09 +0000
Message-ID: <20261125233020.1380594-9-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153108_253497_19F70B4F 
X-CRM114-Status: GOOD (  19.03  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIEVTUDMyLVA0IGRlbGl2ZXJzIG1hY2hpbmUtbW9kZSB0aW1lciBpbnRlcnJ1cHRzIHRocm91
Z2ggdGhlIENMSUMuClNlbGVjdCB0aGUgRVNQMzItUDQgaGFuZGxpbmcgYnkgY29tcGF0aWJsZSBz
dHJpbmcsIHBhcnNlIHRoZSB0d28tY2VsbAppbnRlcnJ1cHQgc3BlY2lmaWVyIGFuZCBjbGVhciB0
aGUgdGltZXIgaW50ZXJydXB0IHRocm91Z2ggbXRpbWVjbXAuCgpQcm9ncmFtIG10aW1lY21wIHdp
dGggdGhyZWUgMzItYml0IHdyaXRlcyB0byBwcmV2ZW50IGFuIGludGVybWVkaWF0ZQpjb21wYXJl
IHZhbHVlIGZyb20gdHJpZ2dlcmluZyBhbiBlYXJseSBpbnRlcnJ1cHQgb24gUlYzMi4KCkVuYWJs
ZSB0aGUgRVNQMzItUDQgbXRpbWUgY291bnRlciBiZWZvcmUgcmVnaXN0ZXJpbmcgdGhlIGNsb2Nr
c291cmNlCnNvIGl0IGNhbiBiZSB1c2VkIGV2ZW4gaWYgZmlybXdhcmUgc3RvcHBlZCBpdC4KClRl
c3RlZCBvbiBhIFdhdmVzaGFyZSBFU1AzMi1QNC1Nb2R1bGUtREVWLUtJVC4gVmVyaWZpZWQgQ0xJ
TlQKY2xvY2tzb3VyY2Ugc2VsZWN0aW9uIGFuZCBkZWxpdmVyeSBvZiB0aW1lciBpbnRlcnJ1cHRz
LgoKQUkgYXNzaXN0ZWQgd2l0aCBkcml2ZXIgZGV2ZWxvcG1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBW
w610b3IgSHVnbyBTaWx2YSA8dml0b3JoZzIwMDgwQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLWNsaW50LmMgfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50LmMgYi9kcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLWNsaW50LmMKaW5kZXggZTU2ZWVlN2UzNzgxLi5iZjViYWUwNzdkN2Eg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItY2xpbnQuYworKysgYi9kcml2
ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50LmMKQEAgLTIwLDYgKzIwLDcgQEAKICNpbmNsdWRl
IDxsaW51eC9pcnEuaD4KICNpbmNsdWRlIDxsaW51eC9pcnFjaGlwL2NoYWluZWRfaXJxLmg+CiAj
aW5jbHVkZSA8bGludXgvaXJxZG9tYWluLmg+CisjaW5jbHVkZSA8bGludXgvbGltaXRzLmg+CiAj
aW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+CiAjaW5jbHVkZSA8bGludXgvc21wLmg+CiAjaW5jbHVk
ZSA8bGludXgvdGltZXguaD4KQEAgLTMxLDYgKzMyLDggQEAKICNkZWZpbmUgQ0xJTlRfSVBJX09G
RgkJMAogI2RlZmluZSBDTElOVF9USU1FUl9DTVBfT0ZGCTB4NDAwMAogI2RlZmluZSBDTElOVF9U
SU1FUl9WQUxfT0ZGCTB4YmZmOAorI2RlZmluZSBFU1AzMlA0X0NMSU5UX01USU1FX0NUTF9PRkYJ
MHg0MDEwCisjZGVmaW5lIEVTUDMyUDRfQ0xJTlRfTVRJTUVfRU4JCUJJVCgwKQogCiAvKiBDTElO
VCBtYW5hZ2VzIElQSSBhbmQgVGltZXIgZm9yIFJJU0MtViBNLW1vZGUgICovCiBzdGF0aWMgdTMy
IF9faW9tZW0gKmNsaW50X2lwaV9iYXNlOwpAQCAtMzksNiArNDIsNyBAQCBzdGF0aWMgdTY0IF9f
aW9tZW0gKmNsaW50X3RpbWVyX2NtcDsKIHN0YXRpYyB1NjQgX19pb21lbSAqY2xpbnRfdGltZXJf
dmFsOwogc3RhdGljIHVuc2lnbmVkIGxvbmcgY2xpbnRfdGltZXJfZnJlcTsKIHN0YXRpYyB1bnNp
Z25lZCBpbnQgY2xpbnRfdGltZXJfaXJxOworc3RhdGljIGJvb2wgY2xpbnRfdXNlc19jbGljIF9f
cm9fYWZ0ZXJfaW5pdDsKIAogI2lmZGVmIENPTkZJR19SSVNDVl9NX01PREUKIHU2NCBfX2lvbWVt
ICpjbGludF90aW1lX3ZhbDsKQEAgLTExOSw2ICsxMjMsMjkgQEAgc3RhdGljIGludCBjbGludF9j
bG9ja19uZXh0X2V2ZW50KHVuc2lnbmVkIGxvbmcgZGVsdGEsCiAJcmV0dXJuIDA7CiB9CiAKK3N0
YXRpYyB2b2lkIGVzcDMycDRfY2xpbnRfd3JpdGVfY21wKHU2NCB2YWx1ZSkKK3sKKwl1MzIgX19p
b21lbSAqY21wID0gKHUzMiBfX2lvbWVtICopY2xpbnRfdGltZXJfY21wOworCisJLyogS2VlcCB0
aGUgaW50ZXJtZWRpYXRlIFJWMzIgY29tcGFyZSB2YWx1ZXMgZnJvbSBleHBpcmluZyBlYXJseS4g
Ki8KKwl3cml0ZWxfcmVsYXhlZChVMzJfTUFYLCBjbXApOworCXdyaXRlbF9yZWxheGVkKCh1MzIp
KHZhbHVlID4+IDMyKSwgY21wICsgMSk7CisJd3JpdGVsX3JlbGF4ZWQoKHUzMil2YWx1ZSwgY21w
KTsKK30KKworc3RhdGljIGludCBlc3AzMnA0X2NsaW50X25leHRfZXZlbnQodW5zaWduZWQgbG9u
ZyBkZWx0YSwKKwkJCQkgICAgc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSAqY2UpCit7CisJZXNw
MzJwNF9jbGludF93cml0ZV9jbXAoY2xpbnRfZ2V0X2N5Y2xlczY0KCkgKyBkZWx0YSk7CisJcmV0
dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgZXNwMzJwNF9jbGludF9zaHV0ZG93bihzdHJ1Y3QgY2xv
Y2tfZXZlbnRfZGV2aWNlICpjZSkKK3sKKwllc3AzMnA0X2NsaW50X3dyaXRlX2NtcChVNjRfTUFY
KTsKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBjbG9ja19l
dmVudF9kZXZpY2UsIGNsaW50X2Nsb2NrX2V2ZW50KSA9IHsKIAkubmFtZQkJPSAiY2xpbnRfY2xv
Y2tldmVudCIsCiAJLmZlYXR1cmVzCT0gQ0xPQ0tfRVZUX0ZFQVRfT05FU0hPVCwKQEAgLTEzMCwx
MyArMTU3LDIyIEBAIHN0YXRpYyBpbnQgY2xpbnRfdGltZXJfc3RhcnRpbmdfY3B1KHVuc2lnbmVk
IGludCBjcHUpCiB7CiAJc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSAqY2UgPSBwZXJfY3B1X3B0
cigmY2xpbnRfY2xvY2tfZXZlbnQsIGNwdSk7CiAKKwlpZiAoY2xpbnRfdXNlc19jbGljKSB7CisJ
CWNlLT5zZXRfbmV4dF9ldmVudCA9IGVzcDMycDRfY2xpbnRfbmV4dF9ldmVudDsKKwkJY2UtPnNl
dF9zdGF0ZV9zaHV0ZG93biA9IGVzcDMycDRfY2xpbnRfc2h1dGRvd247CisJCWNlLT5zZXRfc3Rh
dGVfb25lc2hvdF9zdG9wcGVkID0gZXNwMzJwNF9jbGludF9zaHV0ZG93bjsKKwkJZXNwMzJwNF9j
bGludF9zaHV0ZG93bihjZSk7CisJfQorCiAJY2UtPmNwdW1hc2sgPSBjcHVtYXNrX29mKGNwdSk7
CiAJY2xvY2tldmVudHNfY29uZmlnX2FuZF9yZWdpc3RlcihjZSwgY2xpbnRfdGltZXJfZnJlcSwg
MTAwLCBVTE9OR19NQVgpOwogCiAJZW5hYmxlX3BlcmNwdV9pcnEoY2xpbnRfdGltZXJfaXJxLAog
CQkJICBpcnFfZ2V0X3RyaWdnZXJfdHlwZShjbGludF90aW1lcl9pcnEpKTsKLQllbmFibGVfcGVy
Y3B1X2lycShjbGludF9pcGlfaXJxLAotCQkJICBpcnFfZ2V0X3RyaWdnZXJfdHlwZShjbGludF9p
cGlfaXJxKSk7CisJaWYgKCFjbGludF91c2VzX2NsaWMpCisJCWVuYWJsZV9wZXJjcHVfaXJxKGNs
aW50X2lwaV9pcnEsCisJCQkJICBpcnFfZ2V0X3RyaWdnZXJfdHlwZShjbGludF9pcGlfaXJxKSk7
CisKIAlyZXR1cm4gMDsKIH0KIApAQCAtMTU1LDcgKzE5MSwxMCBAQCBzdGF0aWMgaXJxcmV0dXJu
X3QgY2xpbnRfdGltZXJfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldl9pZCkKIHsKIAlzdHJ1
Y3QgY2xvY2tfZXZlbnRfZGV2aWNlICpldmRldiA9IHRoaXNfY3B1X3B0cigmY2xpbnRfY2xvY2tf
ZXZlbnQpOwogCi0JY3NyX2NsZWFyKENTUl9JRSwgSUVfVElFKTsKKwlpZiAoY2xpbnRfdXNlc19j
bGljKQorCQllc3AzMnA0X2NsaW50X3NodXRkb3duKGV2ZGV2KTsKKwllbHNlCisJCWNzcl9jbGVh
cihDU1JfSUUsIElFX1RJRSk7CiAJZXZkZXYtPmV2ZW50X2hhbmRsZXIoZXZkZXYpOwogCiAJcmV0
dXJuIElSUV9IQU5ETEVEOwpAQCAtMTYzLDYgKzIwMiw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBj
bGludF90aW1lcl9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqZGV2X2lkKQogCiBzdGF0aWMgaW50
IF9faW5pdCBjbGludF90aW1lcl9pbml0X2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCiB7CisJ
Ym9vbCBlc3AzMnA0ID0gb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJlc3AsZXNwMzJwNC1j
bGludCIpOwogCWludCByYzsKIAl1MzIgaSwgbnJfaXJxczsKIAl2b2lkIF9faW9tZW0gKmJhc2U7
CkBAIC0xNzksNyArMjE5LDcgQEAgc3RhdGljIGludCBfX2luaXQgY2xpbnRfdGltZXJfaW5pdF9k
dChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQogCQkJY29udGludWU7CiAJCX0KIAotCQlpZiAoKG9p
cnEuYXJnc19jb3VudCAhPSAxKSB8fAorCQlpZiAob2lycS5hcmdzX2NvdW50ICE9IChlc3AzMnA0
ID8gMiA6IDEpIHx8CiAJCSAgICAob2lycS5hcmdzWzBdICE9IFJWX0lSUV9USU1FUiAmJgogCQkg
ICAgIG9pcnEuYXJnc1swXSAhPSBSVl9JUlFfU09GVCkpIHsKIAkJCXByX2VycigiJXBPRlA6IGlu
dmFsaWQgaXJxICVkIChod2lycSAlZClcbiIsCkBAIC0yMTIsMTAgKzI1MiwxOCBAQCBzdGF0aWMg
aW50IF9faW5pdCBjbGludF90aW1lcl9pbml0X2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCiAJ
CXJldHVybiAtRU5PREVWOwogCX0KIAorCWlmIChlc3AzMnA0KSB7CisJCXZvaWQgX19pb21lbSAq
Y3RsID0gYmFzZSArIEVTUDMyUDRfQ0xJTlRfTVRJTUVfQ1RMX09GRjsKKwkJdTMyIHZhbCA9IHJl
YWRsKGN0bCk7CisKKwkJd3JpdGVsKHZhbCB8IEVTUDMyUDRfQ0xJTlRfTVRJTUVfRU4sIGN0bCk7
CisJfQorCiAJY2xpbnRfaXBpX2Jhc2UgPSBiYXNlICsgQ0xJTlRfSVBJX09GRjsKIAljbGludF90
aW1lcl9jbXAgPSBiYXNlICsgQ0xJTlRfVElNRVJfQ01QX09GRjsKIAljbGludF90aW1lcl92YWwg
PSBiYXNlICsgQ0xJTlRfVElNRVJfVkFMX09GRjsKIAljbGludF90aW1lcl9mcmVxID0gcmlzY3Zf
dGltZWJhc2U7CisJY2xpbnRfdXNlc19jbGljID0gZXNwMzJwNDsKIAogI2lmZGVmIENPTkZJR19S
SVNDVl9NX01PREUKIAkvKgpAQCAtMjc1LDMgKzMyMyw0IEBAIGZhaWxfaW91bm1hcDoKIAogVElN
RVJfT0ZfREVDTEFSRShjbGludF90aW1lciwgInJpc2N2LGNsaW50MCIsIGNsaW50X3RpbWVyX2lu
aXRfZHQpOwogVElNRVJfT0ZfREVDTEFSRShjbGludF90aW1lcjEsICJzaWZpdmUsY2xpbnQwIiwg
Y2xpbnRfdGltZXJfaW5pdF9kdCk7CitUSU1FUl9PRl9ERUNMQVJFKGVzcDMycDRfY2xpbnQsICJl
c3AsZXNwMzJwNC1jbGludCIsIGNsaW50X3RpbWVyX2luaXRfZHQpOwotLSAKMi41Ni4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
