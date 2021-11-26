Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACF7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8y+0ZRp66NPyPwi4rJtFlijaJAigXtWOA4IRzW2Am0=; b=Cb2MIpuO2B5zhF
	HKIMAkfR6iyEzUpyI8LK2qNepuZLtUwAHM/+DlP+zDv+vkrRr2EwM9JlqeYIr6gK88qRmteOqyb9g
	MGncpxIMfvtWdREI/+H23wZ9wNJZ2D6mF9pvrVCuCym0QwHPIObbk6i1MtZylni+j3CxpDeZPXSM2
	WbrideGhyYsaT5nQm9VObWahy5L/kJE0k5diFNpzqKXVCCpXDtY0dXwcJvd/q2gDj3gEUd+JXjxYV
	eQeikhuCuqbKAolbZDpmX+HpsgYZGDcFNY5yhkC3CAYc+8QrCaTXRGgUPk1yquIMpEjoRPKTDOFo8
	Ne5FviJTiQKyvE8QG3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqdt2-00B6JY-As; Fri, 26 Nov 2021 16:15:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqdsz-00B6Ib-Qz
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 16:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637943340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIwlzQg5mrM5RLNTyqo8wjzNsYTDLGVsq/ojfDTmyas=;
 b=hyMcD8D9D94RO2uQX+KlHmLyNkmbn5tF+Bpocbh6nAXbAIesaeHGiWKk4RzJP/wOLMJtg+
 gSUJ1X5B/7YEOF3xGhjHsGnsKjbk6jiyksRauC2oSfLQfgoSENcjUPyIgCTxJ0/y2htkvb
 3ZIXxKqUJKXjhHdE64hG7EQI7sQf1cI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-nxWDWnimNVij76QKU5574A-1; Fri, 26 Nov 2021 11:15:37 -0500
X-MC-Unique: nxWDWnimNVij76QKU5574A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AE0D1006AA1;
 Fri, 26 Nov 2021 16:15:35 +0000 (UTC)
Received: from [10.39.195.16] (unknown [10.39.195.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84381604CC;
 Fri, 26 Nov 2021 16:15:32 +0000 (UTC)
Message-ID: <9545cab7-6365-b20d-fc05-82ace6368661@redhat.com>
Date: Fri, 26 Nov 2021 17:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
Content-Language: en-US
To: Anup Patel <anup.patel@wdc.com>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20211126154020.342924-1-anup.patel@wdc.com>
 <20211126154020.342924-4-anup.patel@wdc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211126154020.342924-4-anup.patel@wdc.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_081541_980094_18235F8C 
X-CRM114-Status: UNSURE (   9.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/26/21 16:40, Anup Patel wrote:
> We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile
> which will allow users to pass additional compile-time flags such
> as "-static".

Is this just for debugging?  I cannot understand if it's used in patch 4.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
