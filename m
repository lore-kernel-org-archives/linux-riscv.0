Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFA5D13564
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q+ueDo+n700vzSgMSK4l8yYVJFheWgdPqpJcedKCcKI=; b=z6U1KMYZbSvPxc
	ZExX60ruHEPaDJZMFUsAsiKSZ+YeAw9nCUSJm2ewHNDqsLNovAXnqBuR6Z6mFNwONV3bKHUVD1Nqa
	d+Y6sD6ejSlVKchtv66YP71T+9KzIPPFpFo68dT7Wvt3c08FBl0+/5eNWgg8KeUfPqF8Db+3RtOkW
	JNd5G4CXNbwuD//OS5fMf/OOfSr0MtrEbSdvGeeUXKWtX+mH6lRqibAmAnBum+AWLzM79xWpPThrN
	F8D/+ggz55rY0bQdbdrlOWXFB6Cw0MDhKtKF/vOrKYZAjryIlWtocWfworhFJ9J+uRmStA855NFa5
	T+Rcyb20FiBSJzIV8NDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t54WH-00000008QbS-232l;
	Sun, 27 Oct 2024 14:45:29 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t54WE-00000008QZS-11xf
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 14:45:28 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7eae96e6624so2336851a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730040324; x=1730645124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LA7ovDYy10u8Lc9oUJDda4GDCHrbHPvh33g7r+01N0I=;
        b=E7xuhrVkCadFe+7fPXV4c0Gr9bdi7s12wxD4BwJ9LbpBsAkFd34+leXj9E4YUBR01P
         EokxTUTqwMc/1CdyFoSahNXrlrXwlWaoZI2wVw3I8S/tCmd3QTJL/s13o2p1xL5zsYQb
         0ggMN4qF/mMbQTTP4BNZTSHVpHWicJhHT3XyTKTLU0qQvz7ZR82LP72aG6Xfb8BimjLN
         nkvTz3PsFLKgTqE8KF10DSGikR2EC47/u3jCAZ78bt69haCU4KtfS6D8vWghndR2YKqF
         BQZU62RprslwXfieLzwbVKCC2fHJUwXJbI+Zz8lFWBL/6rkxFTv2iAxoWW57N4LlaKeL
         t8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730040324; x=1730645124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LA7ovDYy10u8Lc9oUJDda4GDCHrbHPvh33g7r+01N0I=;
        b=FWZ39d2r2R0hVDIBU6J1jLn5Nv92T/SUakz+hx7qMQgpHcPqg+jYmgsmEjUxtDRnYM
         FmT0zD/t9fJTQAqvYDAvY9eFZKbMnxuEWUzL3qpAcoH9Z9ew3wc4ecGrHJZa60qk9BCw
         z8X001FgxXIbSfPvSx+rg1uc7hcRYjciFvY2b8c1EoKkuSLvl0dePUorF9zD9iXv6ReT
         +16nECUdKmVwQTNi8WaUHuOkPXWHwkE5Dq/E8xqOUdpMGNn2vgDg1Kt18rJ6LwyrpJA0
         tgBEZZPjbcxgUUVHu4yTA3/SjXq3MKbid1w0nPahXsJFyQwCFRU6i6If428F/8Thtb+l
         byQg==
X-Forwarded-Encrypted: i=1; AJvYcCUEYFXkduKCjB9xh079FW9tzpHeLQuFkjm/lH47F9QYbNRniUPbqJVXoFhe8hoU37v3pwr6xOc+nNXwow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfxdzJQs+R75btUgjrCxLtyhuCPgi8Hz+3UtBp7i075rQmZkbW
	JZFQZUBh8zGWFJUKUuhN5CjWGsHFtEeXqfefhOAbW652TaWxYAgGxZjUsRZ2rZg=
X-Google-Smtp-Source: AGHT+IEeFI0nqucYFP3u69R5Ja9TjYspR7cibVOeMBZFQT2BryMkO9srCATLXUqSED+U2a84KgdKsA==
X-Received: by 2002:a05:6a21:1706:b0:1d9:2018:9e19 with SMTP id adf61e73a8af0-1d9a85144afmr7512209637.44.1730040324493;
        Sun, 27 Oct 2024 07:45:24 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0cb06sm4065110b3a.115.2024.10.27.07.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:45:24 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v6 0/5] Add DeepComputing FML13V01 board dts
Date: Sun, 27 Oct 2024 22:44:43 +0800
Message-Id: <20241027144448.1813611-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_074526_578679_A645582D 
X-CRM114-Status: GOOD (  24.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series updates Device Tree related files to introduce the
FML13V10 board from DeepComputing, which incorporates a StarFive
JH7110 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The original three versions of this series were posted by Sandie Cao
from DeepComputing.  Her mailer configuration caused mail threading
errors, which led to some confusion.  After some discussion, we have
agreed to take over moving this series toward acceptance.

In the original series, the FML13V10 board DTS file disabled some
nodes that had been enabled in a common included DTSI file.  We
proposed fixing this in a follow-on series.  However there was some
disagreement about the right way to do this.  In the end, Emil
requested that we resolve this by adding two changes to the next
version of the patch series:
- Do not enable any nodes in the common DTSI file that would need
  to be disabled in a board DTS (or DTSI) file.  (Note that there
  still might be nodes enabled in the common file.)
- Because it will differ dependent on board, do not define the
  "dr_mode" (dual-role mode) property in the common DTSI file,
  defining it in the board files instead.

To address this, two new patches have been added to the beginning
of this version of the series.  The first patch no longer enables
nodes that would need to be disabled for the new FML13V01 board,
and enables them instead in the existing boards that need them
enabled.  The second patch moves the definition of the "dr_mode"
property for the usb0 node out of the common file and into the
board files.

The remaining three patches are roughly the same as the three
patches in the previous version of this series.  The final
patch has been modified, because it no longer needs to disable
certain nodes that had previously been enabled.

Below is a version history, including direct links to all of the
patches (note: in v1, v2 and v3, a single link to each series
doesn't work).

Best regards,
Guodong, Alex

v6:
- Updated to apply to the latest version of riscv/for-next
- Move nodes enablement from jh7110-common.dtsi into board dts/dtsi
- Do not specify the USB "dr_mode" property in the common file
- Add Emil's reviewed-by on patch 4 (previously patch 2)

v5:
- Remove the extra "From:" line in commit messages of patch 1 & 2.

https://lore.kernel.org/all/20241020134959.519462-1-guodong@riscstar.com/

v4:
- Board name was changed from FM7110 to FML13V10
- Descriptions for all patches in this series were updated slightly
- Add Rob's ack on patch 2
- In patch 3, device nodes were updated to reflect their proper status

https://lore.kernel.org/all/20241019162605.308475-1-guodong@riscstar.com/

v3:
- Update board features into description
- Add Krzysztof's ack on patch 1

https://lore.kernel.org/all/20240925053123.1364574-1-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240925053123.1364574-2-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240925053123.1364574-3-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240925053123.1364574-4-sandie.cao@deepcomputing.io/

v2:
- Add deepcomputing into vendor list.
- Add deepcomputing,fm7110 into model compatible list.
- Framework Config will be included in later a patch.

https://lore.kernel.org/all/20240924080650.1345485-1-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240924080650.1345485-2-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240924080650.1345485-3-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240924080650.1345485-4-sandie.cao@deepcomputing.io/

v1:
- Add framework dts and config.

https://lore.kernel.org/all/20240923053621.1585972-1-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240923053621.1585972-2-sandie.cao@deepcomputing.io/
https://lore.kernel.org/all/20240923053806.1586080-1-sandie.cao@deepcomputing.io/

Guodong Xu (3):
  riscv: dts: starfive: jh7110-common: revised device node
  riscv: dts: starfive: jh7110-common: move usb0 config to board dts
  riscv: dts: starfive: add DeepComputing FML13V01 board device tree

Sandie Cao (2):
  dt-bindings: vendor: add deepcomputing
  dt-bindings: riscv: starfive: add deepcomputing,fml13v01

 .../devicetree/bindings/riscv/starfive.yaml   |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-common.dtsi      | 10 --------
 .../jh7110-deepcomputing-fml13v01.dts         | 17 +++++++++++++
 .../boot/dts/starfive/jh7110-milkv-mars.dts   | 22 ++++++++++++++++
 .../dts/starfive/jh7110-pine64-star64.dts     | 22 ++++++++++++++++
 .../jh7110-starfive-visionfive-2.dtsi         | 25 +++++++++++++++++++
 8 files changed, 90 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
