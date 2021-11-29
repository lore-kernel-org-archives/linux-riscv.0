Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9D6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 01:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S34mewINxfKsV3U8SJqLc0wbbHkMd1lMcBGKgt2Jf7Y=; b=oKAqU03S8oov0a
	igEzVAQqaN87K6rKwj3kfHXZt2bQRUzMi0o0tqziC9/iCKdPp50D1hGvByv+e8Udnc8clzz9KxKRW
	SJwuAW0XBvxtNGSLqQurF0G7SFQRhrYJIdl48SEPGd5rs8WcS5MLm/AA8IPxCitvCmLXVpZxqTlDb
	jxlsD7oMsY5kKXD+7e8+QEmMFpnR1akOzMb+KGj5jvzU0L5E+LazE0zFBQG+ieEORm75UXp+TIVdo
	jfJ0JwziYjwcHHtdWcb4eXQrxI8I6lY2UMu4w0Hi4izYFJTgNFdm7mzWJaejkrcI4p0apqLJ48Ths
	bLRMbefx7bqX4Tki7nFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrVeq-00H3Pf-K3; Mon, 29 Nov 2021 01:40:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrVem-00H3On-QU
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 01:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638150033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J8MhmGAottj8rByklsYBOCTO3w0A9a0z83LyPAaYS74=;
 b=LCwYlY7dNoibvEbIN5HXFzaZA1Y5B4GBd2wsKs+S8FrsywQj4tqn2SmoryXprKt0HpUe8Y
 OUZeOYxXdV7trmmiXdn6gfNIFkj7uZOr8xdvHVzEnrGw7bmLnak19C0fQ5e4YBWcKEFops
 5OEvJEtkgZyXXdK5gxxqYWV4ecruM8I=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-6L42oiJwPGSNirVFP-AULw-1; Sun, 28 Nov 2021 20:40:32 -0500
X-MC-Unique: 6L42oiJwPGSNirVFP-AULw-1
Received: by mail-pg1-f199.google.com with SMTP id
 s18-20020a63ff52000000b00320f169c0aaso7564637pgk.18
 for <linux-riscv@lists.infradead.org>; Sun, 28 Nov 2021 17:40:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J8MhmGAottj8rByklsYBOCTO3w0A9a0z83LyPAaYS74=;
 b=HeH5o1o1KkCwv93RW/EL3B4whrBZW91bgQmNMjoSk/1x00cQzWD701aXmje2UuYQVJ
 5kLpg7PT7cvJZVsFUlOf8kMkqpofSgsz0QfUMs5V2BuFbgbn9m/nQiQcmgtrRZW+56U2
 tOnC/bIWIhx/MbN4iMmeGtohrbVXQ9H1OpuLs5oOPbBMVlJuXJVMqk6YMzItae77M6+J
 JVb5VXYFh9jWE6CmS7NSyudt5A0DPuBnvOuUytnxquFX0GLcu9VYqqkZpMv+YifZXe4L
 qxNdXKVnzCKizFynYlEqwlZRcfpycQCkpOfueB9kT71eVNiqgX9wh3/xh9KZdr0qh7Q9
 LQWw==
X-Gm-Message-State: AOAM533sFz6RaSib9HKunG7oOPowY2LOvOr1CYYrp/3QPsmH1u+Q0Jy9
 4LTDyA8/EU43ank7KZVu+okS4+Tz3+roIczAqHMxhssOhIiWvXEOOFw+129itRZyXSRK1+448RW
 NZKuCJ1QLqjT1NiMqKQnp0uugy+Q8
X-Received: by 2002:a17:90b:4c4c:: with SMTP id
 np12mr34052982pjb.68.1638150031013; 
 Sun, 28 Nov 2021 17:40:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2v0SCntrTCewEggO1HPs1thoxUoYO8KvVGYjWgC0LUSWe22kMuWp7rOlBQjSs8MTbVqBRvQ==
X-Received: by 2002:a17:90b:4c4c:: with SMTP id
 np12mr34052935pjb.68.1638150030758; 
 Sun, 28 Nov 2021 17:40:30 -0800 (PST)
Received: from samantha.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id e18sm10367575pgl.50.2021.11.28.17.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 17:40:30 -0800 (PST)
From: wefu@redhat.com
To: anup.patel@wdc.com, atishp04@gmail.com, palmer@dabbelt.com,
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
Subject: [PATCH V4 0/2] riscv: add RISC-V Svpbmt Standard Extension supports
Date: Mon, 29 Nov 2021 09:40:05 +0800
Message-Id: <20211129014007.286478-1-wefu@redhat.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_174037_159851_4FC3DB1C 
X-CRM114-Status: GOOD (  10.28  )
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
IGluIHRoZSBhcmNoL3Jpc2N2LyogYW5kIHVzaW5nCmEgZ2xvYmFsIHZhcmlhYmxlKF9fc3ZwYm10
KSBhcyBfUEFHRV9NQVNLL0lPL05PQ0FDSEUgZm9yIHBncHJvdF9ub25jYWNoZWQKKCZ3cml0ZWNv
bWJpbmUpIGluIHBndGFibGUuaC4gV2UgYWxzbyBhZGQgX1BBR0VfQ0hHX01BU0sgdG8gZmlsdGVy
ClBGTiB0aGFuIGJlZm9yZS4KCkVuYWJsZSBpdCBpbiBkZXZpY2V0cmVlIC0gKEFkZCAicmlzY3Ys
c3ZwYm10IiBpbiB0aGUgbW11IG9mIGNwdSBub2RlKQogLSBtbXU6CiAgICAgcmlzY3Ysc3ZwbWJ0
CgpXZWkgRnUgKDIpOgogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIE1NVSBTdGFuZGFyZCBFeHRl
bnNpb25zIHN1cHBvcnQgZm9yIFN2cGJtdAogIHJpc2N2OiBhZGQgUklTQy1WIFN2cGJtdCBleHRl
bnNpb24gc3VwcG9ydHMKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwg
ICAgICAgfCAxMCArKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9maXhtYXAuaCAgICAgICAg
ICAgICAgIHwgIDIgKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oICAgICAg
ICAgICB8IDIxICsrKysrKysrLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRz
LmggICAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oICAgICAgICAgICAgICB8IDM5ICsrKysrKysrKysrKysrLS0tLS0KIGFyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8IDM1ICsrKysrKysrKysr
KysrKysrCiBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NSArKysKIDcgZmlsZXMgY2hhbmdlZCwgMTM2IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygt
KQoKLS0gCjIuMjUuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
