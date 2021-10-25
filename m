Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FF9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 04:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E48CB60F70
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 04:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E48CB60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=efWO5mpd2lu7U9I6ZRAUO/UKyKdgXL7deIltCpCs9rE=; b=C2YmZnH6lJ9Kjg
	wPoiLBxEkb599wecuEWCUQ405ghQE/Bin7a9Gs7r2VSViLJ+v1+BwW+9AmstbiIBTIVWF6tz+/yuT
	msMyAhCrNsdcEodyWc3UTfjmQHGYeKsRY3rJ+hAjt1szVNLVkULqz9wnrx3dE8fr+/YNDO5ML/CMy
	qyC/eOZlUDf1UQ0dL3SLnDu9DV6mfwhOKCmZtw9XNqfFqi5eDP9ABFsUMzI1VgPEdB+4Bl7XhnBYn
	Gf4QjyLiRogS7lYXmbGSqgAeXgPMqFElfFRKrUeR0q4RF8EnAbyqju0780zqFvypiLhkTPGgvlCQf
	KDtV5WuZ9ldU9QMOKx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1merG0-00FEig-Dr; Mon, 25 Oct 2021 04:06:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1merFx-00FEhZ-5O
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 04:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635134796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xt4dSqCcvO8Ds9ncTZOb5dKcnC/w5v8GuDpHPG0IPbk=;
 b=YHcPnIHnkaJz8ssUf0KKbYViIaDviDO3V8Vu6goYuua+CC9kgICUe8CSZLbk2hG0OH8GIv
 gODnLYORD+n0RQSuNco+Sz+A3NUU8Y6sSSfHfDNFxpaTl1h13yjlfNSEOyldZEdzt4RAg5
 g6OgkKe6W3Vg4YJLDNmeG+7dP0bVROM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-38m1ws8zPEqWz0BkwGiSvQ-1; Mon, 25 Oct 2021 00:06:33 -0400
X-MC-Unique: 38m1ws8zPEqWz0BkwGiSvQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 g26-20020a63521a000000b0029524f04f5aso5595669pgb.5
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 21:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xt4dSqCcvO8Ds9ncTZOb5dKcnC/w5v8GuDpHPG0IPbk=;
 b=KqdxZv/xCzugHdECnX3azrC9aHFqBc9cpYp3f+WnFPECKOluytbWZLlPqUezMOsWl4
 PfY5940ubzu7dobXLXObgz5qgx1ubTetciXAp90ZeVfxaBGpD3QMa3lql8tApwOvdrqo
 nh5IYBVKysHJAV1DahcNYnB3K/V4k6z1BRRbLf0Z3e1MvVr9ht+hbKQ2HyhbizarWU9a
 bMLaAqUN0T3GOUbTNO4rtzQw/7xD1En/hSE9TYJun4jG86KlYLrwHSyfenzQXb26UynW
 TcnEbfewNbChI9njEvG4eC/rXnmjr1t0E6Y6lSV+GByZGHka3C/2BUg5CB4CWybBlNP7
 l8+A==
X-Gm-Message-State: AOAM530zXW2WJN3PANiOB6G17St+lbppA28eoG40oOCR6da5icOJwOYK
 ocWAbxMaoRf6DgrP/AozKwqBoMRDwP3ztlrkjwn0S/7vJULluWQ/IRknId0n7nReR80GoGSeuPK
 i6aNF+4bgAJCZ06pnOqoayz0IdIY5
X-Received: by 2002:a05:6a00:1591:b0:47b:eaa8:1a70 with SMTP id
 u17-20020a056a00159100b0047beaa81a70mr5341960pfk.75.1635134791962; 
 Sun, 24 Oct 2021 21:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuKpgNNfZmeGA9xdRKARCXaMf4DsW7R45QGzXVYEhI4kpnnozmulSLyekCqG+/q0mMPlXAoA==
X-Received: by 2002:a05:6a00:1591:b0:47b:eaa8:1a70 with SMTP id
 u17-20020a056a00159100b0047beaa81a70mr5341936pfk.75.1635134791662; 
 Sun, 24 Oct 2021 21:06:31 -0700 (PDT)
Received: from samantha.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a12sm19583944pjq.16.2021.10.24.21.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 21:06:31 -0700 (PDT)
From: wefu@redhat.com
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 guoren@linux.alibaba.com, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 dlustig@nvidia.com, gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, huffman@cadence.com,
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com
Subject: [RESEND PATCH V3 0/2] riscv: add RISC-V Svpbmt Standard Extension
 supports
Date: Mon, 25 Oct 2021 12:06:05 +0800
Message-Id: <20211025040607.92786-1-wefu@redhat.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_210641_330048_19AD104D 
X-CRM114-Status: UNSURE (   9.00  )
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

RnJvbTogRnUgV2VpIDx3ZWZ1QHJlZGhhdC5jb20+CgpUaGlzIHBhdGNoIGZvbGxvd3MgdGhlICBS
SVNDLVYgc3RhbmRhcmQgU3ZwYm10IGV4dGVuc2lvbiBpbiAKcHJpdmlsZWdlIHNwZWMgdG8gc29s
dmUgdGhlIG5vbi1jb2hlcmVudCBTT0MgRE1BIHN5bmNocm9uaXphdGlvbgppc3N1ZXMuCgpUaGUg
c3ZwYm10IFBURSBmb3JtYXQ6CnwgNjMgfCA2Mi02MSB8IDYwLTggfCA3IHwgNiB8IDUgfCA0IHwg
MyB8IDIgfCAxIHwgMAogIE4gICAgIE1UICAgICBSU1cgICAgRCAgIEEgICBHICAgVSAgIFggICBX
ICAgUiAgIFYKICAgICAgICBeCgpPZiB0aGUgUmVzZXJ2ZWQgYml0cyBbNjM6NTRdIGluIGEgbGVh
ZiBQVEUsIHRoZSBiaXRzIFs2Mjo2MV0gYXJlIHVzZWQgYXMKdGhlIE1UIChha2EgTWVtVHlwZSkg
ZmllbGQuIFRoaXMgZmllbGQgc3BlY2lmaWVzIG9uZSBvZiB0aHJlZSBtZW1vcnkgdHlwZXMKYXMg
c2hvd24gaW4gdGhlIGZvbGxvd2luZyB0YWJsZe+8mgpNZW1UeXBlICAgICBSSVNDLVYgRGVzY3Jp
cHRpb24KLS0tLS0tLS0tLSAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCjAwIC0gUE1BICAgIE5vcm1hbCBDYWNoZWFibGUsIE5vIGNoYW5nZSB0byBpbXBs
aWVkIFBNQSBtZW1vcnkgdHlwZQowMSAtIE5DICAgICBOb24tY2FjaGVhYmxlLCBpZGVtcG90ZW50
LCB3ZWFrbHktb3JkZXJlZCBNYWluIE1lbW9yeQoxMCAtIElPICAgICBOb24tY2FjaGVhYmxlLCBu
b24taWRlbXBvdGVudCwgc3Ryb25nbHktb3JkZXJlZCBJL08gbWVtb3J5CjExIC0gUnN2ZCAgIFJl
c2VydmVkIGZvciBmdXR1cmUgc3RhbmRhcmQgdXNlCgpUaGUgc3RhbmRhcmQgcHJvdGVjdGlvbl9t
YXBbXSBuZWVkbid0IGJlIG1vZGlmaWVkIGJlY2F1c2UgdGhlICJQTUEiCnR5cGUga2VlcHMgdGhl
IGhpZ2hlc3QgYml0cyB6ZXJvLgpBbmQgdGhlIHdob2xlIG1vZGlmaWNhdGlvbiBpcyBsaW1pdGVk
IGluIHRoZSBhcmNoL3Jpc2N2LyogYW5kIHVzaW5nCmEgZ2xvYmFsIHZhcmlhYmxlKF9fcmlzY3Zf
c3ZwYm10KSBhcyBfUEFHRV9ETUFfTUFTSy9JTy9OQyBmb3IKcGdwcm90X25vbmNhY2hlZCAoJndy
aXRlY29tYmluZSkgaW4gcGd0YWJsZS5oLgpXZSBhbHNvIGFkZCBfUEFHRV9DSEdfTUFTSyB0byBm
aWx0ZXIgUEZOIHRoYW4gYmVmb3JlLgoKRW5hYmxlIGl0IGluIGRldmljZXRyZWUgLSAoQWRkICJt
bXUtc3VwcG9ydHMtc3ZwYm10IiBpbiBjcHUgbm9kZSkKIC0gbW11LXN1cHBvcnRzLXN2cGJtdAoK
V2VpIEZ1ICgyKToKICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBtbXUtc3VwcG9ydHMtc3ZwYm10
IGZvciBTdnBibXQKICByaXNjdjogYWRkIFJJU0MtViBTdnBibXQgZXh0ZW5zaW9uIHN1cHBvcnRz
CgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sICAgICAgIHwgIDUgKysr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ZpeG1hcC5oICAgICAgICAgICAgICAgfCAgMiArLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggICAgICAgICAgIHwgIDggKystLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaCAgICAgICAgIHwgNDEgKysrKysr
KysrKysrKysrKysrLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAg
ICAgIHwgMzkgKysrKysrKysrKysrKystLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgICAgICAgICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvbW0vaW5p
dC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrKwogNyBmaWxlcyBjaGFuZ2VkLCAx
MTcgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgotLSAKMi4yNS40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
